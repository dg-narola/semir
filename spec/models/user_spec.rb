require 'rails_helper'

RSpec.describe User, type: :model do
  p "-------User-------"
  let(:user) { FactoryGirl.create(:user) }

  describe "associations" do
    it { expect(user).to have_many :seminartopics }
  end

  describe "validations" do
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to validate_uniqueness_of(:username) }
    # it { is_expected.to validate_confirmation_of(:email) }
    it { is_expected.to validate_presence_of(:password).on(:create) }
  end

end
