class PeopleController < ApplicationController
  def create
    person_params = params.require(:person).permit(:firstName, :lastName, contacts: [ :kind, :content ])

    # Adapter
    person_attributes = {
      first_name: person_params[:firstName],
      last_name: person_params[:lastName]
    }

    @person = Person::Create.call({
      person: person_attributes,
      contacts: person_params[:contacts]
    })

    render status: :ok, json: {
        id: @person.id,
        name: @person.name,
        contacts: @person.contacts.map { |contact| { kind: contact.kind, content: contact.content } }
      }
  rescue => exception
    render status: :bad_request, json: { error: exception.message }.to_json
  end
end
