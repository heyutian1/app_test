require "test_helper"

class SessionControllerTest < ActionDispatch::IntegrationTest
  setup do
    @school = schools(:one)
    @member = members(:one)
  end

  test "sign_in" do
    post "/session/sign_in.json", params: { name: @member.name, password: @member.password, school_name: @school.name  }
    assert_response 200
  end

  test "wrong name" do
    post "/session/sign_in.json", params: { name: "wrong name", password: @member.password, school_name: @school.name  }
    assert_response 403
  end

  test "wrong password" do
    post "/session/sign_in.json", params: { name: @member.name, password: "11111111", school_name: @school.name  }
    assert_response 403
  end

  test "wrong school_name" do
    post "/session/sign_in.json", params: { name: @member.name, password: @member.password, school_name: "test" }
    assert_response 403
  end

  test "no transmission name" do
    post "/session/sign_in.json", params: { password: "11111111", school_name: @school.name  }
    assert_response 403
  end

  test "no transmission password" do
    post "/session/sign_in.json", params: { name: @member.name, school_name: @school.name  }
    assert_response 403
  end

  test "no transmission school_name" do
    post "/session/sign_in.json", params: { name: @member.name, password: @member.password }
    assert_response 403
  end

end
