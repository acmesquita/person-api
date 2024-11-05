module People::Rendering
  private

  def render_error(error)
    render status: :bad_request, json: { errors: error[:error] }.to_json
  end

  def render_person(person)
    render status: :ok, json: serialize_person(person)
  end

  def render_people(people)
    render status: :ok, json: serialize_people(people)
  end

  def serialize_person(person)
    {
      id: person.id,
      name: person.name,
      contacts: person.contacts.map { |contact| { kind: contact.kind, content: contact.content } }
    }
  end

  def serialize_people(people)
    people.map do |person|
      serialize_person(person)
    end
  end
end
