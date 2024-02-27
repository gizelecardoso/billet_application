# frozen_string_literal: true

module BilletPayments
  # Class responsible for generate a billet_payment JSON based on the model validations and API required params
  class GenerateJsonToApi
    include Interactor

    delegate :customer, :billet_payment, to: :context

    # rubocop:disable Metrics/AbcSize
    def call
      context.billet_payment_json = {
        amount: context.billet_payments_params[:amount],
        expire_at: set_expire_at_value
      }.merge(prepare_customer_data, billet_payment.present? ? prepare_address2_data : prepare_address1_data)

      context.billet_payment_id = context.billet_payments_params[:id]
    end
    # rubocop:enable Metrics/AbcSize

    private

    def set_expire_at_value
      (Date.today + 7).strftime('%F')
    end

    def prepare_customer_data
      {
        customer_person_name: customer&.name || billet_payment['customer_person_name'],
        customer_cnpj_cpf: customer&.document || billet_payment['customer_cnpj_cpf']
      }
    end

    def prepare_address1_data
      address = customer.addresses.last
      {
        customer_state: address.state,
        customer_address: address.address,
        customer_city_name: address.city,
        customer_zipcode: address.zipcode,
        customer_neighborhood: address.neighborhood
      }
    end

    def prepare_address2_data
      {
        customer_state: billet_payment['customer_state'],
        customer_address: billet_payment['customer_address'],
        customer_city_name: billet_payment['customer_city_name'],
        customer_zipcode: billet_payment['customer_zipcode'],
        customer_neighborhood: billet_payment['customer_neighborhood']
      }
    end
  end
end
