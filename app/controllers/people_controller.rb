class PeopleController < ApplicationController
  def create
    person_params = params.require(:person).permit(:firstName, :lastName)

    # Adapter
    person_attributes = {
      first_name: person_params[:firstName],
      last_name: person_params[:lastName]
    }

    person = Person.new(person_attributes)

    if person.save
      render status: :ok, json: { id: person.id, name: person.name }
    else
      render status: :bad_request, json: person.errors.as_json
    end
  end
end
