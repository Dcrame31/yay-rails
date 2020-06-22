# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_22_203607) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.integer "list_id"
    t.integer "qty"
  end

  create_table "lists", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "budget"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lists_categories", force: :cascade do |t|
    t.integer "list_id"
    t.integer "category_id"
  end

# Could not dump table "users" because of following StandardError
#   Unknown type 'false' for column 'default'

end
