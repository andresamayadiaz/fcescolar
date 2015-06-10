class CreateAdminService
  def call
    country = Country.create!(:name=>'Mexico')
    state = State.create!(:name=>'Mexico')
    person = Person.new(
      email: Rails.application.secrets.admin_email,
      first_name: 'Andres',
      country: country,
      state: state,
      last_academic_degree: 'Phd'
    )
    person.build_person_living_address(
      street: 'testing street 1',
      num_int: '1234567-9',
      num_ext: '1234567-5',
      colonia: 'Chihuahua',
      cp: '555-555',
      municipio: 'test',
      state: state,
      country: country,
      phone_emergency: '911-911-911'
    )
    person.save!
    return person
  end
end
