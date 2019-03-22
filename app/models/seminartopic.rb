# frozen_string_literal: true

# seminartopc model
class Seminartopic < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :descripton, presence: true
end
