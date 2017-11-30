FactoryGirl.define do
  factory :user do
    # after(:build)   { |u| u.skip_confirmation_notification! }
    # after(:create)  { |u| u.confirm }
    sequence(:email) { |n| "test#{n}@example.com" }
    # email            {|n| "email#{n}@email.com" }
    # email "ringo@ringostarr.com"
    password "password"

    password_confirmation "password"
    confirmed_at {Time.zone.now}
  end

end



