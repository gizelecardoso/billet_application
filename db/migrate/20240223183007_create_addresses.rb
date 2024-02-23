# frozen_string_literal: true

# Migration responsible for create address table in the database
class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :address
      t.string :state
      t.string :city
      t.string :zipcode
      t.string :neighborhood

      t.timestamps
    end
  end
end
