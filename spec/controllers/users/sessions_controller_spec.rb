require 'rails_helper'


describe Users::SessionsController, :type => :controller do


  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
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
