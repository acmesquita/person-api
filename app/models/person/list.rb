# frozen_string_literal: true

class Person::List < Solid::Process
  input do
  end

  def call(attributes)
    Given(attributes)
    .and_then(:find_peolpe)
    .and_expose(:people_list, [ :people ])
  end

  def find_peolpe
    Continue(people: Person.all())
  end
end
