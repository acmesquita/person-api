require "test_helper"

class PeopleControllerTest < ActionDispatch::IntegrationTest
  test "should create" do
    params = {
      person: { firstName: "Fulano", lastName: "de tal" }
    }
    post "/people", params: params
    assert_response :success
  end


  test "should not create" do
    params = {
      person: { firstName: "Fulano" }
    }
    post "/people", params: params
    assert_response :bad_request
  end
end
