# frozen_string_literal: true

class Person::Create < Solid::Process
  input do
    attribute :person
    attribute :contacts
  end

  def call(attributes)
    rollback_on_failure {
      Given(attributes)
          .and_then(:create_person)
          .and_then(:create_contacts)
          .and_expose(:person_create, [ :person ])
    }
  end

  def create_person(person:, **)
    Continue(person: Person.create!(person))
  rescue => e
    Failure(:invalid_person, error: e.message)
  end

  def create_contacts(person:, contacts:, **)
    Contact.create!(contacts.map { |contact| contact.merge(person_id: person.id) })
    Continue(person:)
  rescue => e
    Failure(:invalid_contact, error: e.message)
  end
end
