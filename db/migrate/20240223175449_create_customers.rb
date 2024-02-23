# frozen_string_literal: true

# Migration responsible for create customer table in the database
class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :document

      t.timestamps
    end
  end
end
