require 'rails_helper'

RSpec.describe "User", type: :feature do

  include UserModuleHelper

  let(:user){create(:user)}

  describe "Sign up" do
    before do
      sign_up_user("test@example", "test_example", "password")
    end

    it "successfully" do
      sleep 1
      expect(current_path).to eq('/')
    end
  end

  describe "Login" do
    before do
      login_user(user.email, user.password)
      sleep 2
      edit_profile
      sleep 2
      expect(page).to have_field('user_email')
      update_profile_attributes(user)
      sleep 2
      new_seminar
      sleep 2
      new_topic("title", "description", "dhafrsg")
      sleep 2
      edit_seminar
      sleep 2
      edit_topic("title", "descripton", "dharani")
      sleep 2
      show_seminar
      sleep 2
      show_topic
      sleep 2
      delete_seminar
      sleep 2
      delete_topic
    end

    it "successfully" do
      sleep 2
      # expect(current_path).to eq('/users')
      # expect(page).to have_css('h1', text: 'Seminartopics')
      # sleep 1
      expect(current_path).to eq('/seminartopics')
    end

    # it "edits profile with out changing password" do
    #   edit_profile
    #   sleep 2
    #   expect(page).to have_field('user_email')
    #   update_profile_attributes(user)
    #   sleep 2
    #   expect(current_path).to eq('/users')
    # end
  end

  # describe "User Profile" do
  #   before do
  #     login_user(user.email, user.password)
  #   end
  #   it "edits profile with out changing password" do
  #     edit_profile
  #     sleep 2
  #     expect(page).to have_field('user_email')
  #     update_profile_attributes(user)
  #     sleep 2
  #     expect(current_path).to eq('/users')
  #   end
  #
  # end

  # describe "New" do
  #   before do
  #    login_user(user.email, user.password )
  #    sleep 2
  #    new_seminar
  #    sleep 2
  #    new_topic("title", "description", "dhafrsg")
  #    sleep 2
  #    edit_seminar
  #    sleep 2
  #    edit_topic("title", "descripton", "dharani")
  #    sleep 2
  #    show_seminar
  #    sleep 2
  #    show_topic
  #    sleep 2
  #    delete_seminar
  #    sleep 2
  #    delete_topic
  #   end
  #
  #   it "successfully" do
  #     sleep 1
  #     expect(current_path).to eq('/seminartopics')
  #   end
  # end

  # describe "Edit" do
  #   before do
  #     login_user(user.email, user.password )
  #     sleep 2
  #     new_topic("title", "description", "dhafrsg")
  #     sleep 2
  #     edit_seminar
  #     sleep 2
  #     edit_topic("title", "descripton", "dharani")
  #   end
  #
  #   it "successfully" do
  #     sleep 1
  #     expect(current_path).to eq('/seminartopics/1')
  #   end
  # end
  #
  # describe "Show" do
  #   before do
  #     login_user(user.email, user.password )
  #     sleep 2
  #     new_topic("title", "description", "dhafrsg")
  #     sleep 2
  #     show_seminar
  #     sleep 2
  #     show_topic
  #   end
  #
  #   it "successfully" do
  #     sleep 1
  #     expect(current_path).to eq('/seminartopics/1')
  #   end
  # end
  #
  # describe "Delete" do
  #   before do
  #     login_user(user.email, user.password )
  #     sleep 2
  #     new_topic("title", "description", "dhafrsg")
  #     sleep 2
  #     delete_seminar
  #     sleep 2
  #     delete_topic
  #   end
  #
  #   it "successfully" do
  #     sleep 1
  #     expect(current_path).to eq('/seminartopics')
  #   end
  # end

end
