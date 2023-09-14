create_table 'mansion_rooms' do |t|
  t.bigint 'mansion_id', null: false
  t.string 'name', null: false
  t.string 'layout', null: false
  t.integer 'thanks_money', null: false
  t.integer 'security_deposit', null: false
  t.integer 'floor_number', null: false
  t.integer 'stay_fee', null: false
  t.integer 'rent', null: false
  t.integer 'maintenance_fee', null: false
  t.string 'contract_duration', null: false
  t.string 'reserve_url', null: true

  t.datetime 'created_at'
  t.datetime 'updated_at'
end

add_foreign_key 'mansion_rooms', 'mansions'
