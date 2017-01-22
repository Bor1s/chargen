FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "user#{n}@example.com"
    end

    password 'foobarpwd'
    password_confirmation 'foobarpwd'
  end
end
