module BilletPayments
  class GenerateBilletPaymentJson
    include Interactor

    delegate :customer, to: :context

    def call
      context.billet_payment_json = {
        amount: context.billet_payments_params[:amount],
        expire_at: set_expire_at_value,
        customer_person_name: customer.name,
        customer_cnpj_cpf: customer.document,
        customer_state: customer.addresses.last.state,
        customer_address: customer.addresses.last.address,
        customer_city_name: customer.addresses.last.city,
        customer_zipcode: customer.addresses.last.zipcode,
        customer_neighborhood: customer.addresses.last.neighborhood
      }
    end

    private
    def set_expire_at_value
      (Date.today + 7).strftime("%F")
    end
  end
end
