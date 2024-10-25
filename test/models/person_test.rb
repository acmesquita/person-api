require "test_helper"

class PersonTest < ActiveSupport::TestCase
  test "create with first and last name" do
    person = Person.new(
      first_name: "John",
      last_name: "Silver"
    )

    assert person.valid?
    assert "John Silver" == person.name
  end

  test "must be invalid if last_name is not provided" do
    person = Person.new(
      first_name: "John"
    )

    assert person.valid? == false
    assert "John " == person.name
  end
end
