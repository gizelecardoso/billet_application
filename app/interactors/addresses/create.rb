# frozen_string_literal: true

module Addresses
  # Class responsible for CREATE an address into the database
  class Create
    include Interactor

    def call
      context.address = Address.new(context.address_params)

      context.fail!(error: :invalid_record) unless context.address.save
    end
  end
end
