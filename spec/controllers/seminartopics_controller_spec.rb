# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SeminartopicsController, type: :controller do

  before(:each) do
   @user =  FactoryGirl.create(:user)
   p'user',@user
   sign_in @user
   @seminartopic = FactoryGirl.create(:seminartopic)
   p'Seminartopic',@seminartopic
 end

 describe "GET index" do
   it "has a 200 status code" do
     get :index
     expect(response.status).to eq(200)
   end
 end

  describe "GET show" do
    it "has a 200 status code" do
      get :show, params: {id: @seminartopic.id}
      expect(response.status).to eq(200)
    end
  end

  describe "GET new" do
    it "has a 200 status code" do
      get :new, params: {title: @seminartopic.title,descripton: @seminartopic.descripton,studname: @seminartopic.studname,user_id: @seminartopic.user_id}
      expect(response.status).to eq(200)
    end
  end

  describe "GET edit" do
    it "has a 200 status code" do
      get :edit, params: {id: @seminartopic.id}
      expect(response.status).to eq(200)
    end
  end

  describe "POST create" do
    context "with valid params" do
      it "creates a new Seminartopic" do
        expect {
          post :create, params: {seminartopic: {title: @seminartopic.title,descripton: @seminartopic.descripton,studname: @seminartopic.studname,user_id: @seminartopic.user_id}}
        }.to change(Seminartopic, :count).by(1)
      end

      it "redirects to the created seminartopic" do
        post :create, params: {seminartopic: {title: @seminartopic.title,descripton: @seminartopic.descripton,studname: @seminartopic.studname,user_id: @seminartopic.user_id}}
        expect(response).to redirect_to(Seminartopic.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {seminartopic: {title: @seminartopic.title,descripton: @seminartopic.descripton,studname: @seminartopic.studname,user_id: @seminartopic.user_id}}
        expect(response.status).to eq(302)
      end
    end
  end

  describe "PUT update" do
    context "with valid params" do
      it "updates the requested seminartopic" do
        put :update, params: {id: @seminartopic.id, seminartopic: {title: @seminartopic.title,descripton: @seminartopic.descripton,studname: @seminartopic.studname,user_id: @seminartopic.user_id}}
        @seminartopic.reload
      expect(response.status).to eq(302)
      end

      it "redirects to the seminartopic" do
        put :update, params: {id: @seminartopic.id, seminartopic: {title: @seminartopic.title,descripton: @seminartopic.descripton,studname: @seminartopic.studname,user_id: @seminartopic.user_id}}
        expect(response).to redirect_to(@seminartopic)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: {id: @seminartopic.id, seminartopic: {title: @seminartopic.title,descripton: @seminartopic.descripton,studname: @seminartopic.studname,user_id: @seminartopic.user_id}}
          expect(response.status).to eq(302)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested seminartopic" do
      expect {
        delete :destroy, params: {id: @seminartopic.id}
      }.to change(Seminartopic, :count).by(-1)
    end

    it "redirects to the seminartopics list" do
      delete :destroy, params: {id: @seminartopic.id}
      expect(response).to redirect_to(seminartopics_url)
    end
  end

end
