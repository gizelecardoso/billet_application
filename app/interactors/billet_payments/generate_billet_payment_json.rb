module BilletPayments
  class GenerateBilletPaymentJson
    include Interactor

    delegate :billet_payment, to: :context

    def call
      context.billet_payment_json = {
        amount: billet_payment.amount,
        expire_at: billet_payment.expires_at.strftime("%F"),
        customer_person_name: billet_payment.customer.name,
        customer_cnpj_cpf: billet_payment.customer.document,
        customer_state: billet_payment.customer.addresses.last.state,
        customer_address: billet_payment.customer.addresses.last.address,
        customer_city_name: billet_payment.customer.addresses.last.city,
        customer_zipcode: billet_payment.customer.addresses.last.zipcode,
        customer_neighborhood: billet_payment.customer.addresses.last.neighborhood
      }
    end
  end
end
