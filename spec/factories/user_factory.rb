FactoryGirl.define do

  sequence(:email) {|n|  "user#{n}@test.com"}

  factory :user do
    email
    password "123456"
    first_name "Test"
    last_name "User"
    admin false

    factory :admin_user do
      admin true
    end

  end

end