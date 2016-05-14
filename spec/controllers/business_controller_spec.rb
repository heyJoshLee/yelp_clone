require "spec_helper"

describe BusinessesController do

  describe "GET index" do
    it "sets @businesses" do
      business1 = Fabricate(:business)
      business2 = Fabricate(:business)
      get :index
      expect(assigns(:businesses)).to match_array([business1, business2])
    end
  end


  describe "GET new" do

    context "logged in user" do
      before do
        alice = Fabricate(:user)
        session[:user_id] = alice.id
        get :new
      end
      it "set @business" do
        expect(assigns(:business)).to be_instance_of(Business)
      end

    end

    context "user not logged in" do

      it "redirects to log in page" do
        get :new
        expect(response).to redirect_to root_path
      end

      it "sets the flash message" do
        get :new
        expect(flash[:danger]).not_to be_blank
      end

    end

  end

  describe "POST new" do

    context "logged in user" do
      it "creates the business" do
        post :create, business: Fabricate.attributes_for(:business)
        expect(Business.count).to eq(1)
      end

      it "redirects to the created business's page" do
        category = Fabricate(:category)
        business_params = Fabricate.attributes_for(:business, category_id: category.id)
        post :create, business: business_params
        expect(response).to redirect_to business_path(Business.first)
      end
    end
  end


  describe "GET show" do

    before do
      business = Fabricate(:business, id:1)
      get :show, id: 1
    end
    it "sets @business" do
      expect(assigns(:business)).to be_instance_of(Business)
    end

    it "sets @review" do
      expect(assigns(:review)).to be_instance_of(Review)
    end
  end
  
end 