FactoryGirl.define do
  factory :user do
    sequence(:email) do |n|
      "example#{n}@example.com"
    end
    password "password"
    password_confirmation "password"
    username "dharani"
    # confirmed_at Time.zone.now
    # current_sign_in_at Time.zone.now
  end

  # trait :confirmed do
  #   confirmed_at Time.zone.now
  #   current_sign_in_at Time.zone.now
   #end

  # trait :verified do
  # end
  #
  # trait :unverified do
  #   email nil
  #   password nil
  #   password_confirmation nil
  # end
end
