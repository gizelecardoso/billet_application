module Addresses
  class Create
    include Interactor

    def call
      context.address = Address.create!(context.address_params)
    end
  end
end
