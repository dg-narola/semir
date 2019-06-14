# frozen_string_literal: true

FactoryGirl.define do
  factory :user do
    sequence(:email) do |n|
      "example#{n}@example.com"
    end
    password "password"
    password_confirmation "password"
    sequence(:username) do |n|
      "dharani#{n}"
    end
  end
end
