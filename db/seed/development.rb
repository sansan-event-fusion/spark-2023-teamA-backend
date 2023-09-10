# db/seeds.rb or another initialization script

require 'yaml'

ActiveRecord::Base.connection.tables.each do |t|
    ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

file_path = Rails.root.join('db', 'fixtures', 'structure_types.yml')
data = YAML.load_file(file_path)

data.each do |id, values|
  StractureType.create!(id: id, **values)
end
