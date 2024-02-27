# frozen_string_literal: true

# Controller responsible for received the main requests for billet_payment
class BilletPaymentsController < ApplicationController
  before_action :prepare_customer, only: [:new]
  before_action :find_billet, only: %i[show edit update]

  def index
    result = BilletPayments::List.call

    @billet_payments = result.billet_payments.present? ? result.billet_payments : []
    respond_to do |format|
      format.html
      format.json { render json: @billet_payments }
    end
  end

  def show; end

  def new
    @billet_payment = BilletPayment.new
  end

  def create
    result = BilletPayments::CreateOrganizer.call(
      billet_payments_params: billet_payments_params.merge(customer_id: params[:customer_id])
    )

    if result.success?
      redirect_to billet_payment_path(result.billet_payment)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    result = BilletPayments::EditOrganizer.call(
      billet_payment: @billet_payment,
      billet_payments_params: billet_payments_params.merge(customer_id: params[:customer_id])
    )

    if result.success?
      redirect_to billet_payment_path(result.billet_payment, id: result.billet_payment['id'])
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def billet_payments_params
    params.permit(:amount, :status, :id)
  end

  def prepare_customer
    @customer_id = Customer.find(params[:customer_id]).id
  end

  def find_billet
    @billet_payment = BilletPayments::Find.call(billet_payment_id: params[:id]).billet_payment
  end
end
