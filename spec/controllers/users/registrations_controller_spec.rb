require 'rails_helper'


describe Users::RegistrationsController do

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  before :each do
    sign_out :user
  end


  describe 'POST /users' do

    context "unsuccessful registration" do

      it "doesn't register new user without a name" do
        expect {
          attributes = attributes_for :user, name: nil
          post :create, user: attributes
        }.not_to change User, :count
      end

      it "doesn't register new user without an email" do
        expect {
          attributes = attributes_for :user, email: nil
          post :create, user: attributes
        }.not_to change User, :count
      end

      it "doesn't register new user without a password" do
        expect {
          attributes = attributes_for :user, password: nil
          post :create, user: attributes
        }.not_to change User, :count
      end

      it "doesn't register new user without a valid password" do
        expect {
          short_password = "aa"
          attributes = attributes_for :user, password: short_password
          post :create, user: attributes
        }.not_to change User, :count
      end

      it "reloads sign up page" do
        attributes = attributes_for :user, name: nil
        post :create, user: attributes
        # FAILS
        expect(response).to render_template :new
      end

    end


    context "successful registration" do
      
      it "creates a new user" do
        expect {
          post :create, user: attributes_for(:user)
        }.to change(User, :count).by(1)
      end

      it "redirects to home" do
        post :create, user: attributes_for(:user)
        expect(response).to redirect_to root_path
      end

    end

  end
    
end