module Customers
  class Create
    include Interactor

    def call
      context.customer = Customer.create!(context.customers_params)
    end
  end
end
