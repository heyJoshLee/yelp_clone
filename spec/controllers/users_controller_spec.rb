require "spec_helper"

describe UsersController do

  describe "GET new" do

    it "sets @user" do
      get :new
      expect(assigns(:user)).to be_instance_of(User)
    end
  end

  describe "POST create" do

    context "with valid inputs" do

      let(:user) { Fabricate.attributes_for(:user) }
      it "redirects to home_path" do
        post :create, user: user
        expect(response).to redirect_to root_path
      end

      it "create new user" do
        post :create, user: user
        expect(User.count).to eq(1)
      end

    end

    context "with invalid inputs" do

      it "doesn't create the user" do
        post :create, user: {email: "josh@example.com"}
        expect(User.count).to eq(0)
      end

      it "renders the new users template" do
        post :create, user: {email: "josh@example.com"}
        expect(response).to render_template :new
      end



    end
  end

  describe "GET show" do
    it "sets @user" do
      alice = Fabricate(:user)
      get :show, id: alice.id
      expect(assigns(:user)).to eq(alice)
    end
  end

end