create_table 'mansion_rooms' do |t|
  t.bigint 'mansion_id', null: false
  t.string 'name', null: false
  t.string 'layout', null: false
  t.integer 'thanksMoney', null: false
  t.integer 'securityDeposit', null: false
  t.integer 'floorNumber', null: false
  t.text 'available_dates', array: true, presence: true
  t.bigint 'room_status_id', null: false
  t.integer 'stayFee', null: false
  t.integer 'rent', null: false
  t.integer 'maintenanceFee', null: false
  t.string 'contractDuration', null: false

  t.datetime 'created_at'
  t.datetime 'updated_at'
end

add_foreign_key :mansion_rooms, :mansions