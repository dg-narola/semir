# frozen_string_literal: true

FactoryGirl.define do
  factory :seminartopic do
    title "title"
    descripton "seminar"
    studname "dharani"
    association :user,factory: :user
  end
end
