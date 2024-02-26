module BilletPayments
  class CreateOrganizer
    include Interactor::Organizer

    organize Customers::Find,
      GenerateBilletPaymentJson,
      CreateApi,
      Create
  end
end
