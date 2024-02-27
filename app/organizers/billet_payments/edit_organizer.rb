# frozen_string_literal: true

module BilletPayments
  # Class responsible for organize all the steps to EDIT a billet_payment into Api and DB
  class EditOrganizer
    include Interactor::Organizer

    organize GenerateJsonToApi,
             EditApi,
             Find,
             GenerateData,
             Edit
  end
end
