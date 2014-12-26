require 'rails_helper'


describe Users::SessionsController do


  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  before :each do
    sign_out :user
  end


  describe 'POST /users/sign_in' do

    context "failed" do

      it "reloads sign in page"

    end


    context "successful" do

      it "redirects to home page" do
        user = create(:user)
        sign_in user
        get :new
        expect( response ).to redirect_to root_path
      end

    end

  end


  describe 'DELETE /users/sign_out' do

    it "redirects to home page"

  end

end
