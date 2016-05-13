require "spec_helper"

describe SessionsController do

  describe "User can log in" do

    context "user is already logged in" do
      it "redirects user to the root_path" do
        session[:user_id] = Fabricate(:user).id
        get :new
        expect(response).to redirect_to root_path
      end

      it "sets the flash message" do
        session[:user_id] = Fabricate(:user).id
        get :new
        expect(flash[:error]).not_to be_blank
      end
    end

    context "with valid inputs" do 

      let(:alice) { Fabricate(:user) }
      
      before do
        post :create, email: alice.email, password: alice.password
      end

      it "redirects to the sign in path" do
        expect(response).to redirect_to root_path
      end

      it "sets the session variable with the correct user" do
        expect(session[:user_id]).to eq(alice.id)
      end

    end
  

    context "with invalid inputs" do
      let(:alice) { Fabricate(:user) }

      before do
       post :create, email: alice.email, password: alice.password + "124"
      end

      it "should not set the session" do
        expect(session[:user_id]).to be_nil
      end

      it "should render the new template" do
        expect(response).to render_template :new
      end
    end
  end

  describe "User can log out" do

    before do
      session[:user_id] = Fabricate(:user).id
      get :destroy
    end

    it "sets the session variable to nil" do
      expect(session[:user_id]).to be_nil
    end

    it "redirect to the root_path" do
      expect(response).to redirect_to root_path
    end

    it "sets the flash message" do
      expect(flash[:success]).not_to be_blank

    end

  end
  
end