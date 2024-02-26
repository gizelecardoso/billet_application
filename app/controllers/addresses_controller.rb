# frozen_string_literal: true

# Controller responsible for received the request to create customers addresses
class AddressesController < ApplicationController
  before_action :prepare_customer, only: [:new]

  def new
    @address = Address.new
  end

  def create
    result = Addresses::Create.call(address_params: address_params.merge(customer_id: params[:customer_id]))

    if result.success?
      redirect_to new_billet_payment_path(customer_id: result.address.customer.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def address_params
    params.permit(:address, :city, :state, :zipcode, :neighborhood)
  end

  def prepare_customer
    @customer_id = Customer.find(params[:customer_id]).id
  end
end
