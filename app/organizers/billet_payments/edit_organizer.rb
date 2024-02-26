module BilletPayments
  class EditOrganizer
    include Interactor::Organizer

    organize GenerateBilletPaymentData,
      EditApi,
      Edit
  end
end
