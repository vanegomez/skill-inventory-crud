require 'sequel'
require_relative '../../app/models/skill_inventory'

SkillInventory.database.create_table :skills do
  primary_key :id
  String :name
  String :status
end
