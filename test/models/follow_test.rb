require "test_helper"

class FollowTest < ActiveSupport::TestCase
  
  test "should not save follow without member_id" do
    follow = follows(:one)
    follow.member_id = ''
    assert_not follow.save
  end

  test "should not save follow without followable_id_id" do
    follow = follows(:one)
    follow.followable_id = ''
    assert_not follow.save
  end

  test "should not save follow without followable_type" do
    follow = follows(:one)
    follow.followable_type = ''
    assert_not follow.save
  end

end
