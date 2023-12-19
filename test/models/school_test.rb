require "test_helper"

class SchoolTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "should not save school without name" do
    school = School.new
    assert_not school.save
  end

  test "should not save school with same name" do
    school = School.new(name: 'test')

    assert_not school.save
  end
end
