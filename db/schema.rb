ActiveRecord::Schema.define(version: 20190308070610) do

  enable_extension "plpgsql"

  create_table "lines", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
