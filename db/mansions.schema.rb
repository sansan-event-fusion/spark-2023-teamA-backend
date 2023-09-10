create_table 'mansions', force: :cascade do |t|
    t.bigint 'rental_house_id', null: false

    t.datetime 'created_at'
    t.datetime 'updated_at'
end
add_foreign_key 'mansions', 'rental_houses'