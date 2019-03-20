require 'rails_helper'

RSpec.describe Seminartopic, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:seminartopic) {
    {
      title: "Testq1",
      descripton: "Narola",
      studname:  "dharani",
      user_id: user.id
    }
  }

  describe "associations" do
    it { expect(seminartopics).to belong_to :user }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:studname)}
    it { is_expected.to validate_presence_of(:title)}
    it { is_expected.to validate_presence_of(:descripton)}
  end

end
