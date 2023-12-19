require "test_helper"

class MemberTest < ActiveSupport::TestCase

  test "should not save member without name" do
    member = members(:one)
    member.name = ''
    assert_not member.save
  end

  test "should not save member without school" do
    member = members(:one)
    member.school_id = ''
    assert_not member.save
  end

  test "should not save member without password" do
    member = members(:one)
    member.password = ''
    assert_not member.save
  end

  test "should not save member without confirm_password" do
    member = members(:one)
    member.confirm_password = ''
    assert_not member.save
  end

  test "should not save member with confirm_password is different from the password" do
    member = members(:one)
    member.confirm_password = '123456766'
    assert_not member.save
  end

  test "should not save member with same name at same school" do
    school = schools(:two)
    member1 = members(:one)
    member2 = members(:two)

    member1.name = member2.name
    assert_not member1.save

    member1.school_id = school.id
    assert member1.save
  end

end
