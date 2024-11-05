require "test_helper"

class PeopleControllerTest
  class Create < ActionDispatch::IntegrationTest
    test "should create" do
      params = {
        person: {
          firstName: "Fulano",
          lastName: "de tal",
          contacts: [
            { kind: "phone", content: "(86)9999-9999" }
          ]
        }
      }
      post "/people", params: params
      assert_response :success
    end


    test "should not create if lastName don't provided" do
      params = {
        person: { firstName: "Fulano" }
      }
      post "/people", params: params
      assert_response :bad_request
    end

    test "should not create if kind of contact is invalid" do
      params = {
        person: {
          firstName: "Fulano",
          lastName: "de tal",
          contacts: [
              { kind: "whatsapp", content: "(86)9999-9999" }
            ]
      }
      }
      post "/people", params: params
      assert_response 400
    end
  end

  class List < ActionDispatch::IntegrationTest
    test "should list all persons" do
      get "/people"
      assert_response :success

      result = JSON.parse response.body

      assert_equal 2, result.count
    end


    test "should return a empty list when without persons" do
      Person.destroy_all

      get "/people"
      assert_response :success

      result = JSON.parse response.body

      assert_equal 0, result.count
    end
  end
end
