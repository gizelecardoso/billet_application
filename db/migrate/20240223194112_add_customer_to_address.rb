# frozen_string_literal: true

# Migration responsible for add association to customer on address table in the database
class AddCustomerToAddress < ActiveRecord::Migration[7.1]
  def change
    add_reference :addresses, :customer, null: false, foreign_key: true
  end
end
