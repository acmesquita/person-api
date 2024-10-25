class PeopleController < ApplicationController
  def create
    Person.transaction do
      person_params = params.require(:person).permit(:firstName, :lastName, contacts: [ :kind, :content ])

      # Adapter
      person_attributes = {
        first_name: person_params[:firstName],
        last_name: person_params[:lastName]
      }

      person = Person.new(person_attributes)

      if person.save
        person_params[:contacts].each do |contact_params|
          Contact.create(contact_params.merge(person_id: person.id))
        end

        render status: :ok, json: {
          id: person.id,
          name: person.name,
          contacts: person.contacts.map { |contact| { kind: contact.kind, content: contact.content } }
        }
      else
        render status: :bad_request, json: person.errors.as_json
      end
    end
  rescue => exception
    render json: { error: exception.message }.to_json, status: 500
  end
end
