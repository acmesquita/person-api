require "test_helper"

class PeopleControllerTest < ActionDispatch::IntegrationTest
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
