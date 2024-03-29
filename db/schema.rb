# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 20_240_226_123_818) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'addresses', force: :cascade do |t|
    t.string 'address'
    t.string 'state'
    t.string 'city'
    t.string 'zipcode'
    t.string 'neighborhood'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'customer_id', null: false
    t.index ['customer_id'], name: 'index_addresses_on_customer_id'
  end

  create_table 'billet_payments', force: :cascade do |t|
    t.float 'amount'
    t.string 'status'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.date 'expire_at'
    t.bigint 'customer_id', null: false
    t.integer 'api_id'
    t.index ['customer_id'], name: 'index_billet_payments_on_customer_id'
  end

  create_table 'customers', force: :cascade do |t|
    t.string 'name'
    t.string 'document'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'addresses', 'customers'
  add_foreign_key 'billet_payments', 'customers'
end
