require "test_helper"

class MembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @member = members(:one)
    @member1 = members(:two)
    @school = schools(:one)
  end

  test "should get index" do
    get "/members.json", headers: { "MemberToken" => @member.token }
    assert_response :success
  end

  test "should follow" do
    assert_difference("@member.follows.count") do 
      post "/members/follow.json", 
      headers: { "MemberToken" => @member.token },
      params: { member_id: @member1.id }
    end

    assert_response :success
  end

  test "should unfollow" do
    post "/members/follow.json", 
    headers: { "MemberToken" => @member.token },
    params: { member_id: @member1.id }

    assert_response :success

    assert_difference("@member.follows.count", -1) do
      post "/members/unfollow.json", 
      headers: { "MemberToken" => @member.token },
      params: { member_id: @member1.id }
    end

    assert_response :success
  end

  test "should get followers" do
    get "/members/#{@member.id}/followers.json", 
    headers: { "MemberToken" => @member.token }

    assert_response :success
  end

  test "follow no transmission member_id" do
    post "/members/unfollow.json", 
    headers: { "MemberToken" => @member.token }

    assert_response 403
  end

  test "unfollow no transmission member_id" do
    post "/members/unfollow.json", 
    headers: { "MemberToken" => @member.token }

    assert_response 403
  end
end
