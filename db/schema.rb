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

ActiveRecord::Schema.define(version: 20161126062940) do

  create_table "acompanies", force: :cascade do |t|
    t.string   "aname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"

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
    t.text     "remark"
    t.string   "danjo"
    t.date     "birth"
    t.string   "piccus"
    t.string   "groupcus"
    t.string   "kubun"
    t.string   "maildm"
  end

  create_table "kamons", force: :cascade do |t|
    t.string   "title"
    t.text     "discription"
    t.string   "kamonpic"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "kubuns", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "markinfos", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  create_table "notes", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
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

  create_table "performs", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "performimage"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "pimages", force: :cascade do |t|
    t.string   "ptitle"
    t.string   "purl"
    t.string   "pcomment"
    t.string   "ptag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "pimage"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sprices", force: :cascade do |t|
    t.string   "teikyo"
    t.string   "acompany"
    t.string   "skuc"
    t.string   "jproduct"
    t.string   "eproduct"
    t.string   "pnumber"
    t.string   "p1cos"
    t.string   "p2cos"
    t.string   "p3cos"
    t.string   "p4cos"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["context"], name: "index_taggings_on_context"
  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
  add_index "taggings", ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
  add_index "taggings", ["taggable_id"], name: "index_taggings_on_taggable_id"
  add_index "taggings", ["taggable_type"], name: "index_taggings_on_taggable_type"
  add_index "taggings", ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
  add_index "taggings", ["tagger_id"], name: "index_taggings_on_tagger_id"

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "tasks", force: :cascade do |t|
    t.string   "title"
    t.boolean  "done",       default: false
    t.integer  "project_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "tasks", ["project_id"], name: "index_tasks_on_project_id"

  create_table "teikyos", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "image"
    t.text     "remark"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
