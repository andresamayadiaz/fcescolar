class CreateAdminService
  def call
    user = User.find_or_create_by!(email: Rails.application.secrets.admin_email) do |user|
        user.password = Rails.application.secrets.admin_password
        user.password_confirmation = Rails.application.secrets.admin_password
        user.confirm!
        user.add_role :super_administrator
        country = Country.create!(:name=>'Mexico')
        user.profile = Profile.create!(
        	:user_id => user.id,
        	:last_academic_degree => 'PhD',
        	:country_id => country.id,
        	:state_id => State.create!(:name=>'Mexico',:country_id=>country.id).id
        )
      end
  end
end
