FactoryBot.define do
  factory :audit_log do
    user user
    status 1
    start_date "2018-05-29"
    end_date "2018-05-29"
  end
end
