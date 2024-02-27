# frozen_string_literal: true

module BilletPayments
  # Class responsible for organize all the steps to CANCEL a billet_payment into Api and DB
  class CancelOrganizer
    include Interactor::Organizer

    organize CancelApi,
             Find,
             Cancel
  end
end
