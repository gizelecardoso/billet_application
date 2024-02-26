module BilletPayments
  class CreateOrganizer
    include Interactor::Organizer

    organize Create,
      GenerateBilletPaymentJson,
      CreateApi
  end
end
