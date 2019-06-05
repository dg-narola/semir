# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  p "-------User-------"
  let(:user) { FactoryGirl.create(:user) }
  let(:seminartopic) { FactoryGirl.create(:seminartopic) }

  describe "associations" do
    it { expect(user).to have_many :seminartopic }
  end

  describe "validations" do
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to validate_uniqueness_of(:username) }
    # it { is_expected.to validate_confirmation_of(:email) }
    it { is_expected.to validate_presence_of(:password).on(:create) }
  end
end
