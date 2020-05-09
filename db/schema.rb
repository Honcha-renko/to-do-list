# frozen_string_literal: true

ActiveRecord::Schema.define(version: 2020_04_30_223132) do
  enable_extension "plpgsql"

  create_table "tasks", force: :cascade do |t|
    t.string "title", null: false
    t.text "text"
    t.integer "tag"
    t.boolean "done", default: false
    t.datetime "expire_on"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
