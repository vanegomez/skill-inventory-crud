require_relative '../test_helper'

class SkillTest < Minitest::Test
  def test_assigns_attributes_correctly
    data = {  id: 1,
              name: "a name",
              status: "some status" }

    skill = Skill.new(data)

    assert_equal 1, skill.id
    assert_equal "a name", skill.name
    assert_equal "some status", skill.status
  end
end
