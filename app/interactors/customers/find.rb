module Customers
  class Find
    include Interactor

    def call
      context.customer = Customer.find_by_id(context.billet_payments_params[:customer_id])
    end
  end
end
