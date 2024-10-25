# frozen_string_literal: true

class Person::Create
  attr_accessor :person, :params

  def initialize(params)
    @params = params
  end

  def self.call(params)
    new(params).call
  end

  def call
    ActiveRecord::Base.transaction do
      create_person
      create_contacts
    end

    person
  end

  private

  def create_person
    @person = Person.create(person_attributes)
  end

  def create_contacts
    contacts_params.each do |contact_param|
      Contact.create(contact_param.merge(person_id: @person.id))
    end
  end

  def person_attributes
    params[:person]
  end

  def contacts_params
    params[:contacts]
  end
end
