module BilletPayments
  class List
    include Interactor

    def call
      context.billet_payments = BilletPayment.all.in_order_of(:status, %w(opened overdue canceled))
    end
  end
end
