require 'yaml/store'
require_relative 'skill'

class SkillInventory
  def self.database
    if ENV["SKILL_INVENTORY_ENV"] == "test"
      @database ||= Sequel.sqlite('db/skill_inventory_test.sqlite3')
    else
      @database ||= Sequel.sqlite('db/skill_inventory_dev.sqlite3')
    end
  end

  def self.create(skill)
    dataset .insert(skill)
  end

  def self.all
    dataset.map { |data| Skill.new(data) }
  end

  def self.find(id)
    skill = dataset.where(id: id)
    Skill.new(skill.to_a.first)
  end

  def self.update(id, data)
    dataset.where(id: id).update(data)
  end

  def self.destroy(id)
    dataset.where(id: id).delete
  end

  def self.delete_all
    dataset.delete
  end

  private

  def self.dataset
    database.from(:skills)
  end
end
