# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160925075510) do

  create_table "customers", force: :cascade do |t|
    t.string   "name1"
    t.string   "name2"
    t.string   "kana1"
    t.string   "kana2"
    t.string   "zip"
    t.string   "address1"
    t.string   "address2"
    t.string   "address3"
    t.string   "tel1"
    t.string   "tel2"
    t.string   "fax"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ordersheets", force: :cascade do |t|
    t.string   "os_customerid"
    t.string   "os_orderid"
    t.string   "os_neworder"
    t.string   "os_ordername"
    t.string   "os_groupname"
    t.string   "os_customername1"
    t.string   "os_customername2"
    t.string   "os_zip"
    t.string   "os_address1"
    t.string   "os_address2"
    t.string   "os_address3"
    t.string   "os_tel1"
    t.string   "os_tel2"
    t.string   "os_fax"
    t.string   "os_email"
    t.string   "os_toiday"
    t.string   "os_orderday"
    t.string   "os_nohinday"
    t.string   "os_shukinday"
    t.string   "os_nohin"
    t.string   "os_shukin"
    t.string   "os_image1"
    t.string   "os_image2"
    t.string   "os_image3"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
