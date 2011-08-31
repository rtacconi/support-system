require 'machinist/active_record'

User.blueprint do
  email {Faker::Internet.email}
  name {"#{Faker::Name.first_name} #{Faker::Name.last_name}"}
  password {"password"}
  password_confirmation {"password"}
end

Issue.blueprint do
  name {"#{Faker::Name.first_name} #{Faker::Name.last_name}"}
  email {Faker::Internet.email}
  subject {'Subject of the issue'}
  body {"My server has a root kit... I need a security exeprt to an..."}
  reference {'ABC-123456'}
  status {Status.make!}
  user {User.make!}
end

Status.blueprint do
  name {'Waiting for Staff Response'}
end