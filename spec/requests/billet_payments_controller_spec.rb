# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BilletPaymentsController, type: :request do
  describe 'GET #index' do
    it 'returns http success' do
      customer = create(:customer, :with_addresses)
      billet_payment_json = {
        id: 10,
        amount: 100,
        expire_at: (Date.today + 7).strftime('%F'),
        status: 'opened',
        customer_person_name: customer.name,
        customer_cnpj_cpf: customer.document,
        customer_state: customer.addresses.last.state,
        customer_address: customer.addresses.last.address,
        customer_city_name: customer.addresses.last.city,
        customer_zipcode: customer.addresses.last.zipcode,
        customer_neighborhood: customer.addresses.last.neighborhood
      }.transform_keys(&:to_s)

      returned_data = BoletoSimples::BankBillet.new(billet_payment_json)

      expect(BoletoSimples::BankBillet).to receive(:all).and_return([returned_data])

      get billet_payments_path

      expect(response).to render_template(:index)
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    context 'when passed valid params' do
      it 'redirect to show page' do
        customer = create(:customer, :with_addresses)
        billet_payment_json = {
          id: 10,
          amount: 100,
          expire_at: (Date.today + 7).strftime('%F'),
          status: 'opened',
          customer_person_name: customer.name,
          customer_cnpj_cpf: customer.document,
          customer_state: customer.addresses.last.state,
          customer_address: customer.addresses.last.address,
          customer_city_name: customer.addresses.last.city,
          customer_zipcode: customer.addresses.last.zipcode,
          customer_neighborhood: customer.addresses.last.neighborhood,
          customer_id: customer.id
        }.transform_keys(&:to_s)

        expect(BoletoSimples::BankBillet)
          .to receive(:create)
          .and_return(BoletoSimples::BankBillet.new(billet_payment_json))

        bank_billet = BoletoSimples::BankBillet.new(billet_payment_json)
        expect(BoletoSimples::BankBillet).to receive(:find).and_return(bank_billet)

        post billet_payments_path(params: billet_payment_json)

        expect(response).to redirect_to billet_payment_path(id: billet_payment_json['id'])
      end
    end

    context 'when doesnt passed valid params' do
      it 'render page new again' do
        customer = create(:customer, :with_addresses)
        billet_payment_json = { customer_id: customer.id }

        expect(BoletoSimples::BankBillet)
          .to receive(:create)
          .and_return(BoletoSimples::BankBillet.new(billet_payment_json))

        bank_billet = BoletoSimples::BankBillet.new(billet_payment_json)
        expect(BoletoSimples::BankBillet).to receive(:find).and_return(bank_billet)

        post billet_payments_path(params: billet_payment_json)

        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PUT #update' do
    context 'when passed valid params' do
      it 'redirect to show page' do
        bill = create(:billet_payment, api_id: 10)
        billet_payment_json = {
          expire_at: (Date.today + 8).strftime('%F'),
          customer_id: bill.customer.id
        }.transform_keys(&:to_s)

        billet_payment = {
          'id' => 10,
          'amount' => 100,
          'expire_at' => (Date.today + 7).strftime('%F'),
          'status' => 'opened',
          'customer_person_name' => 'Gizele Correia',
          'customer_cnpj_cpf' => '819.574.470-28',
          'customer_state' => 'SP',
          'customer_address' => 'Rua Teste',
          'customer_city_name' => 'São Paulo',
          'customer_zipcode' => '04587-985',
          'customer_neighborhood' => 'Teste'
        }

        bank_billet = BoletoSimples::BankBillet.new(billet_payment)
        allow(BoletoSimples::BankBillet).to receive(:find).and_return(bank_billet)
        allow(BilletPayments::EditApi).to receive(:call).with(billet_payment_id: 10,
                                                              billet_payment_json:).and_return(204)

        put billet_payment_path(id: 10), params: billet_payment_json

        expect(response).to redirect_to billet_payment_path(bank_billet)
      end
    end

    xcontext 'when doesnt passed valid params' do
      it 'render page new again' do
        customer = create(:customer, :with_addresses)
        billet_payment_json = {
          amount: 20,
          customer_id: customer.id
        }.transform_keys(&:to_s)

        billet_payment = {
          'id' => 10,
          'amount' => 100,
          'expire_at' => (Date.today + 7).strftime('%F'),
          'status' => 'opened',
          'customer_person_name' => 'Gizele Correia',
          'customer_cnpj_cpf' => '819.574.470-28',
          'customer_state' => 'SP',
          'customer_address' => 'Rua Teste',
          'customer_city_name' => 'São Paulo',
          'customer_zipcode' => '04587-985',
          'customer_neighborhood' => 'Teste'
        }

        bank_billet = BoletoSimples::BankBillet.new(billet_payment)
        allow(BoletoSimples::BankBillet).to receive(:find).and_return(bank_billet)
        allow(BilletPayments::EditApi).to receive(:call)
          .with(billet_payment_id: 10, billet_payment_json:).and_return(:unprocessable_entity)

        put billet_payment_path(id: 10), params: billet_payment_json

        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'PUT #cancel' do
    context 'when passed valid params' do
      it 'redirect to show page' do
        customer = create(:customer, :with_addresses)
        billet_payment = create(:billet_payment, customer:, api_id: 10)

        billet_payment_json = {
          id: billet_payment.api_id,
          status: 'canceled'
        }.transform_keys(&:to_s)

        allow(BoletoSimples::BankBillet)
          .to receive(:cancel)
          .and_return(BoletoSimples::BankBillet.new(billet_payment_json))

        bank_billet = BoletoSimples::BankBillet.new(billet_payment_json)
        allow(BoletoSimples::BankBillet).to receive(:find).and_return(bank_billet)

        put '/billet_payments/10/cancel', params: billet_payment_json

        expect(response).to redirect_to billet_payment_path(id: billet_payment_json['id'])
      end
    end

    context 'when doesnt passed valid params' do
      it 'render page new again' do
        customer = create(:customer, :with_addresses)
        billet_payment = create(:billet_payment, customer:, api_id: 10)

        billet_payment_json = {
          id: billet_payment.api_id,
          status: 'canceled'
        }.transform_keys(&:to_s)

        allow(BoletoSimples::BankBillet)
          .to receive(:cancel)
          .and_return(BoletoSimples::BankBillet.new(billet_payment_json))

        bank_billet = BoletoSimples::BankBillet.new(billet_payment_json)
        allow(BoletoSimples::BankBillet).to receive(:find).and_return(bank_billet)

        put '/billet_payments/1/cancel', params: billet_payment_json

        expect(response).to render_template(:show)
      end
    end
  end
end
