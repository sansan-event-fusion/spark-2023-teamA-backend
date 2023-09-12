create_table 'mansion_room_photos', force: :cascade do |t|
    t.bigint 'mansion_room_id', null: false
    t.string 'image', null: false

    t.datetime 'created_at'
    t.datetime 'updated_at'
end

add_foreign_key 'mansion_room_photos', 'mansion_rooms'