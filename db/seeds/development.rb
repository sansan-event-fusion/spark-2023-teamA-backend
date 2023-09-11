# db/seeds.rb or another initialization script

require 'yaml'

ActiveRecord::Base.connection.tables.each do |t|
    ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

file_path = Rails.root.join('db', 'masters', 'structure_types.yml')

structure_types = YAML.load_file('db/masters/structure_types.yml')
structure_types.each do |structure_type|
  StructureType.create!(structure_type)
end
