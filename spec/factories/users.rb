FactoryBot.define do
  factory :user do
    first_name { Faker::Name.name }
    last_name { Faker::Name.name }
    username { Faker::Name.unique.name }
    password 'foobar'
  end
end
