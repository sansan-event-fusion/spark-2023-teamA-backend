create_table 'rental_house_photos', force: :cascade do |t|
    t.bigint 'rental_house_id', null: false
    t.string 'image', null: false

    t.datetime 'created_at'
    t.datetime 'updated_at'
end
add_foreign_key 'rental_house_photos', 'rental_houses'