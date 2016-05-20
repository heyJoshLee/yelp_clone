require "spec_helper"

describe CategoriesController do

  describe "GET index" do
    it "sets @categories" do
      category1 = Fabricate(:category)
      category2 = Fabricate(:category)
      get :index
      expect(assigns(:categories)).to match_array([category1, category2])
    end

  end

  describe "GET new" do
    context "with logged in users" do
      it "sets @category" do
        sign_in
        get :new
        expect(assigns(:category)).to be_instance_of(Category)
      end
    end

    it_behaves_like "requires sign in" do
      let(:action) { get :new}
    end
  end

  describe "POST create" do

      context "with valid inputs" do

        let(:category_params) { Fabricate.attributes_for(:category) }

        before do
          post :create , category: category_params
        end
        
        it "create a category" do
          expect(Category.count).to eq(1)
        end

        it "redirects to the categories page" do
          expect(response).to redirect_to category_path(Category.first)
        end
      end

      context "with invalid inputs" do
        let(:category_params) { {name: "1"} }

        before do
          post :create , category: category_params
        end

        it "not create a the category" do
          expect(Category.count).to eq(0)
        end

        it "renders the new template" do
          expect(response).to render_template :new
        end
        it "sets the flash message" do
          expect(flash[:danger]).not_to be_blank
        end
      end
    end

    it_behaves_like "requires sign in" do
      let(:action) { get :new}
    end
    
  describe "GET show" do
    it "sets @category" do
      category = Fabricate(:category)
      get :show, id: category.id
      expect(assigns(:category)).to eq(category)
    end
  end


end