# frozen_string_literal: true

FactoryBot.define do
  factory :seminartopics do
    title 'title'
    descripton 'seminar'
    studname 'dharani'

    association :user
  end
end
