FactoryBot.define do
  sequence :email do |n|
    "test#{n}@test.com"
  end

  factory :user do
    first_name "Sergio"
    last_name "Alves"
    password "password"
    password_confirmation "password"
    email { generate :email }
    phone "983293812"
  end

  factory :admin_user, class: "AdminUser" do
    first_name "Admin"
    last_name "User"
    password "password"
    password_confirmation "password"
    email { generate :email }
    phone "555030242"
  end

    factory :not_authorised_user, class: "User" do
    first_name "Non"
    last_name "Authorised"
    password "password"
    password_confirmation "password"
    email { generate :email }
    phone "983293812"
  end
end

