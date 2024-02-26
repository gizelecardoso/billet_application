# frozen_string_literal: true

# Controller responsible for received the main requests for billet_payment
class BilletPaymentsController < ApplicationController
  before_action :prepare_customer, only: [:new]
  before_action :find_billet, only: [:show, :edit, :update]

  def index
    result = BilletPayments::List.call

    @billet_payments = result.billet_payments
    respond_to do |format|
      format.html
      format.json { render json: @billet_payments }
    end
  end

  def show
    @customer = @billet_payment.customer
    @address = @customer.addresses.first
  end

  def new
    @billet_payment = BilletPayment.new
  end

  def create
    # result_account = CreateAccount.call

    # if result_account.success?
    result = BilletPayments::CreateOrganizer.call(billet_payments_params: billet_payments_params.merge(customer_id: params[:customer_id]))

    if result.success?
      redirect_to result.billet_payment
    else
      render :new, status: :unprocessable_entity
    end
    # end
  end

  def edit
  end

  def update
    if @billet_payment.update(billet_payments_params)
      redirect_to @billet_payment
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def billet_payments_params
    params.permit(:amount, :status)
  end

  def prepare_customer
    @customer_id = Customer.find(params[:customer_id]).id
  end

  def find_billet
    @billet_payment = BilletPayments::Find.call(billet_payment_id: params[:id]).billet_payments
  end
end
