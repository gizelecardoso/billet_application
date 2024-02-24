# frozen_string_literal: true

# Controller responsible for received the main requests for billet_payment
class BilletPaymentsController < ApplicationController
  before_action :prepare_customer, only: [:new]

  def index
    @billet_payments = BilletPayment.all

    respond_to do |format|
      format.html
      format.json { render json: @billet_payments }
    end
  end

  def show
    @billet_payment = BilletPayment.find(params[:id])
    @customer = @billet_payment.customer
    @address = @customer.addresses.first
  end

  def new
    @billet_payment = BilletPayment.new
  end

  def create
    @billet_payment = BilletPayment.new(billet_payments_params.merge(customer_id: params[:customer_id]))

    if @billet_payment.save!
      redirect_to @billet_payment
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @billet = BilletPayment.find(params[:id])
  end

  def update
    @billet_payment = BilletPayment.find(params[:id])

    if @billet_payment.update(billet_payments_params)
      redirect_to @billet_payment
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def billet_payments_params
    params.permit(:amount, :status, :address)
  end

  def prepare_customer
    @customer_id = Customer.find(params[:customer_id]).id
  end
end
