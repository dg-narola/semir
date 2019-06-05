# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Seminartopic, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:seminartopic) { FactoryGirl.create(:seminartopic) }

  describe "associations" do
    it { should belong_to :user}
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:title)}
    it { is_expected.to validate_presence_of(:descripton)}
  end
end
