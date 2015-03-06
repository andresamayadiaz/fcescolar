class CreateAdminService
  def call
    country = Country.create!(:name=>'Mexico')
    state = State.create!(:name=>'Mexico')
    person = Person.find_or_create_by!(
      email: Rails.application.secrets.admin_email,
      country: country,
      state: state,
      last_academic_degree: 'Phd'
    )
    user = User.find_or_create_by!(email: Rails.application.secrets.admin_email) do |user|
        user.name = 'Andres Amaya Diaz'
        user.password = Rails.application.secrets.admin_password
        user.password_confirmation = Rails.application.secrets.admin_password
        user.confirm!
        user.add_role :super_administrator
      end
    person.user = user
  end
end
