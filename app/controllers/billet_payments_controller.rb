# frozen_string_literal: true

# Controller responsible for received some requests of the system
class BilletPaymentsController < ApplicationController
  before_action :prepare_params

  def index
    @billets = BilletPayment.all

    respond_to do |format|
      format.html
      format.json { render json: @billets }
    end
  end

  def show
    @billet = BilletPayment.find(params[:id])
    @customer = @billet.customer
    @address = @customer.addresses.first
  end

  def new
    @customer = Customer.new
    @address = Address.new
    @billet = BilletPayment.new
  end

  def create
    @customer = Customer.new(@customer_params)
    @address = Address.new(@address_params.merge(customer: @customer))
    @billet_payment = BilletPayment.new(@billet_params.merge(customer: @customer))

    if @billet_payment.save! and @customer.save! and @address.save!
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

    if @billet_payment.update(@billet_params)
      redirect_to @billet_payment
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def prepare_params
    @customer_params = { name: params[:name], document: params[:document] }
    @address_params = { address: params[:address], city: params[:city], state: params[:state], zipcode: params[:zipcode], neighborhood: params[:neighborhood] }
    @billet_params = { amount: params[:amount], status: params[:status] }
  end
end
