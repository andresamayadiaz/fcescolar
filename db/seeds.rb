# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
person = CreateAdminService.new.call
person.user.confirm!
[:super_administrator, :franchise_director, :academic_coordinator, :finance, :head_of_school_control, :support_executive, :salesman, :teacher, :student, :system_daemon].each do |role|
  Role.where(name: role).first_or_create
end
new_user_role = UsersRole.new(:role=>Role.first, :user=>person.user, :contract=>'Admin Contract I', :contract_sign_date=>Date.today, :date_of_receipt=>Date.today)
puts 'CREATED ADMIN USER: ' << person.user.email if new_user_role.save
