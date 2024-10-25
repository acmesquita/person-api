class PeopleController < ApplicationController
  def create
    person_params = params.require(:person).permit(:first_name, :last_name)

    person = Person.new(person_params)

    if person.save
      render status: 200, json: { id: person.id, name: person.name }
    else
      render status: 422, json: person.errors.as_json
    end
  end
end
