# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AddressesController, type: :request do
  describe 'GET #new' do
    it 'returns http success' do
      customer = create(:customer)
      get new_address_path(customer_id: customer.id)

      expect(response).to render_template(:new)
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    context 'when passed valid params' do
      it 'redirect to show page' do
        customer = create(:customer)
        billet_payment_json = {
          state: 'SP',
          address: 'Rua Teste',
          city: 'São Paulo',
          zipcode: '04587-985',
          neighborhood: 'Teste'
        }.transform_keys(&:to_s)

        post addresses_path(customer_id: customer.id), params: billet_payment_json

        expect(response.headers['location']).to include('/billet_payments/new?customer_id=')
      end
    end

    context 'when doesnt passed valid params' do
      it 'render page new again' do
        billet_payment_json = {}

        post addresses_path, params: billet_payment_json

        expect(response).to render_template(:new)
      end
    end
  end
end
