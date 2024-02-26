# frozen_string_literal: true

# Controller responsible for received the request to create customers
class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    result = Customers::Create.call(customers_params: customer_params)

    if result.success?
      redirect_to new_address_path(customer_id: result.customer.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def customer_params
    params.permit(:name, :document)
  end
end
