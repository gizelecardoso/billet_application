# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AddressesController, type: :request do
  describe 'GET #new' do
    xit 'returns http success' do
      get new_address_path

      expect(response).to render_template(:new)
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    xcontext 'when passed valid params' do
      it 'redirect to show page' do
        customer = create(:customer)
        billet_payment_json = {
          customer_state: 'SP',
          customer_address: 'Rua Teste',
          customer_city_name: 'São Paulo',
          customer_zipcode: '04587-985',
          customer_neighborhood: 'Teste',
          customer_id: customer.id
        }.transform_keys(&:to_s)

        post addresses_path, params: billet_payment_json

        expect(response).to redirect_to new_address_path
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
