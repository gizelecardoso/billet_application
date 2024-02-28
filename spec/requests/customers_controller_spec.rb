# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CustomersController, type: :request do
  xdescribe 'GET #new' do
    it 'returns http success' do
      get new_customer_path

      expect(response).to render_template(:new)
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    xcontext 'when passed valid params' do
      it 'redirect to show page' do
        billet_payment_json = {
          name: 'Gizele Santos',
          document: '863.308.970-00'
        }.transform_keys(&:to_s)

        post customers_path, params: billet_payment_json

        expect(response).to redirect_to new_address_path
      end
    end

    context 'when doesnt passed valid params' do
      it 'render page new again' do
        billet_payment_json = {}

        post customers_path, params: billet_payment_json

        expect(response).to render_template(:new)
      end
    end
  end
end
