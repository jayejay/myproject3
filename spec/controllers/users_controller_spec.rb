require 'rails_helper'

describe UsersController, :type => :controller do
  before do
    #@user = User.create!(email: "testuser@testify.com", password: "123456",first_name: "Test", last_name:"User")
    #@user2 = User.create!(email: "testuser2@testify.com", password: "122456",first_name: "Test", last_name:"User2")
    @user = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user, last_name: "User2", email: "another@user.com")
  end

  describe "GET #show" do

    context "User is logged in" do
      before do
        sign_in @user
      end

      it "loads correct user details" do

        get :show, params:{id: @user.id}

        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq @user

      end

    end

    context "No user is logged in" do

      it "redirects to login" do

        get :show, params: {id: @user.id}

        expect(response).to redirect_to(new_user_session_path)

      end

    end

    context "Current User is not allowed" do

      before do
        sign_in @user
      end

      it "to see other users details" do

        get :show, params:{id: @user2.id}

        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)


      end

    end

  end

end