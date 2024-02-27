# frozen_string_literal: true

module Customers
  # Class responsible for CREATE a customer into the database
  class Create
    include Interactor

    def call
      context.customer = Customer.create!(context.customers_params)
    end
  end
end
