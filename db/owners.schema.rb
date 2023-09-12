create_table 'owners', force: :cascade do |t|
  t.string 'email', null: false
  t.string 'password_digest', null: false
  t.string 'phone_number', null: false
  t.string 'last_name', null: false
  t.string 'first_name', null: false

  t.datetime 'created_at'
  t.datetime 'updated_at'
end
