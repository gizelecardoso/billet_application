# frozen_string_literal: true

module Customers
  # Class responsible for CREATE a customer into the database
  class Create
    include Interactor

    def call
      context.customer = Customer.new(context.customers_params)

      context.fail!(error: :invalid_record) unless context.customer.save
    end
  end
end
