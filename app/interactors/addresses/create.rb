# frozen_string_literal: true

module Addresses
  # Class responsible for CREATE an address into the database
  class Create
    include Interactor

    def call
      context.address = Address.create!(context.address_params)
    end
  end
end
