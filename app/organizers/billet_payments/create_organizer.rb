# frozen_string_literal: true

module BilletPayments
  # Class responsible for organize all the steps to CREATE a billet_payment into Api and DB
  class CreateOrganizer
    include Interactor::Organizer

    organize Customers::Find,
             GenerateJsonToApi,
             CreateApi,
             Find,
             GenerateData,
             Create
  end
end
