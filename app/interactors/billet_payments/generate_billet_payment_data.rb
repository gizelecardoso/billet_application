module BilletPayments
  class GenerateBilletPaymentData
    include Interactor

    delegate :billet_payment, to: :context

    def call
      context.billet_payment_json = {
        amount: context.billet_payments_params[:amount],
        expire_at: set_expire_at_value,
        customer_person_name: billet_payment["customer_person_name"],
        customer_cnpj_cpf: billet_payment["customer_cnpj_cpf"],
        customer_state: billet_payment["customer_state"],
        customer_address: billet_payment["customer_address"],
        customer_city_name: billet_payment["customer_city_name"],
        customer_zipcode: billet_payment["customer_zipcode"],
        customer_neighborhood: billet_payment["customer_neighborhood"]
      }
    end

    private
    def set_expire_at_value
      (Date.today + 7).strftime("%F")
    end
  end
end
