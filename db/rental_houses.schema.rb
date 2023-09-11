create_table 'rental_houses', force: :cascade do |t|
    t.bigint 'owner_id', null: false
    t.bigint 'structure_type_id', null: false
    t.string 'name', null: false
    t.string 'address', null: false
    t.integer 'maxFloorNumber', null: false
    t.integer 'buildingAge', null: false
  
    t.datetime 'created_at'
    t.datetime 'updated_at'
end
add_foreign_key 'rental_houses', 'owners'
add_foreign_key 'rental_houses', 'structure_types'
