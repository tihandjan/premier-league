FactoryGirl.define do
  sequence(:email) { |n| "person#{n}@example.com" }
  factory :user do
    email
    username 'test-user-name'
    password 'password'
  end
end
