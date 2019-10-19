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

ActiveRecord::Schema.define(version: 2019_10_19_160728) do

  create_table "domains", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "impacts", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "solutions", force: :cascade do |t|
    t.string "before_en"
    t.string "after_en"
    t.string "before_de"
    t.string "after_de"
    t.integer "vf_case_id"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vf_case_id"], name: "index_solutions_on_vf_case_id"
  end

  create_table "tctypes", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vf_cases", force: :cascade do |t|
    t.string "name"
    t.string "case_class"
    t.boolean "is_active"
    t.integer "domain_id"
    t.integer "impact_id"
    t.integer "tctype_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["domain_id"], name: "index_vf_cases_on_domain_id"
    t.index ["impact_id"], name: "index_vf_cases_on_impact_id"
    t.index ["tctype_id"], name: "index_vf_cases_on_tctype_id"
  end

end
