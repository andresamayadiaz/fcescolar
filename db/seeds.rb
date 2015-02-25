# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

[:super_administrator, :franchise_director, :academic_coordinator, :finance, :head_of_school_control, :support_executive, :salesman, :teacher, :student, :system_daemon].each do |role|
  Role.where(name: role).first_or_create
end
