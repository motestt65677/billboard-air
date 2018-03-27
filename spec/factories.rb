FactoryBot.define do

  factory :user do
    email "asdf@gmail.com"
    first_name "John"
    last_name "White"
    password_digest "asdfasdf"
  end







  factory :board do
    title Faker::Company.name
    location Faker::Address.street_name
    current_price Faker::Number.between(100, 1000)
    images [Faker::Avatar.image]
    user
  end


end



