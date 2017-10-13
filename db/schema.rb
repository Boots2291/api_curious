ActiveRecord::Schema.define(version: 20_171_012_175_430) do
  enable_extension 'plpgsql'

  create_table 'users', force: :cascade do |t|
    t.string 'nickname'
    t.string 'email'
    t.string 'provider'
    t.string 'token'
    t.string 'uid'
    t.string 'image_url'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
