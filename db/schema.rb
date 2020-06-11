ActiveRecord::Schema.define(version: 2020_06_11_124506) do

  enable_extension "plpgsql"

  create_table "topics", force: :cascade do |t|
    t.string "title", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
