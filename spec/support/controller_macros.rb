module ControllerMacros
  extend ActiveSupport::Concern

  module ClassMethods
    def login_verified_user
      login_user(:verified)
    end
    alias_method :login_user, :login_verified_user

    def login_unverified_teacher
      login_user(:unverified)
    end

    def create_records
      before do
        @user = FactoryGirl.create(:user)
        @seminartopic = FactoryGirl.create(:seminartopic)
      end
    end

    private
    def login_user(user_trait)
      before do
        request.env['devise.mapping'] = Devise.mappings[:user]
        @current_user = FactoryGirl.create(:user, :confirmed, user_trait)
        sign_in @current_user
      end
    end

  end
end

RSpec.configure do |config|
  config.include ControllerMacros, type: :controller
end
