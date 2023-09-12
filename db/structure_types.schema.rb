create_table 'structure_types', force: :cascade do |t|
  t.string 'name', null: false

  t.datetime 'created_at'
  t.datetime 'updated_at'
end
