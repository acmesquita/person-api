class PeopleController < ApplicationController
  include People::Rendering
  def index
    result = Person::List.call

    case result
    in Solid::Failure(_, error); render_error(error)
    in Solid::Success(people:); render_people(people)
    end
  end

  def create
    result = Person::Create.call({
      person: person_attributes,
      contacts: person_params[:contacts]
    })

    case result
    in Solid::Failure(:invalid_person | :invalid_contact, error); render_error(error)
    in Solid::Success(person:); render_person(person)
    end
  end

  private

  def person_params
    @person_params ||= params.require(:person).permit(:firstName, :lastName, contacts: [ :kind, :content ])
  end

  def person_attributes
    {
      first_name: person_params[:firstName],
      last_name: person_params[:lastName]
    }
  end
end
