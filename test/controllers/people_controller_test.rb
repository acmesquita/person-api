require "test_helper"

class PeopleControllerTest < ActionDispatch::IntegrationTest
  test "should create" do
    post "/people", params: { person: { firstName: "Fulano", lastName: "de tal" } }
    assert_response :success
  end
end
