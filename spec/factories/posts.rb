FactoryBot.define do
  factory :post do
    date Date.today
    rationale "some rationale"
    overtime_request 2.9
    user
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "some content"
    user
  end

  factory :third_post, class: "Post" do
    date Date.yesterday
    rationale "content"
    overtime_request 0.5
    not_authorised_user
  end
end
