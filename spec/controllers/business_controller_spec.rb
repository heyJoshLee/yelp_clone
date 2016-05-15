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

      it "set @business" do
        alice = Fabricate(:user)
        sign_in(alice)
        get :new
        expect(assigns(:business)).to be_instance_of(Business)
      end

    end

    it_behaves_like "requires sign in" do
      let(:action) { get :new}
    end

  end

  describe "POST new" do

    context "logged in user" do
      let(:business_params) { Fabricate.attributes_for(:business) }
      let(:category) { Fabricate(:category) }

      before do
        post :create, business: business_params
      end
      
      it "creates the business" do
        expect(Business.count).to eq(1)
      end

      it "redirects to the created business's page" do
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