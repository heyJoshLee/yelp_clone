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
        session[:user_id] = Fabricate(:user).id
        get :new
        expect(assigns(:category)).to be_instance_of(Category)
      end
    end

    context "with not logged in users" do
      it "redirects to the sign_in page" do
        get :new
        expect(response).to redirect_to root_path
      end
      it "sets the flash message error" do
        get :new
        expect(flash[:error]).not_to be_blank
      end
    end

  end
  describe "POST create" do
    context "with logged in user" do

      context "with valid inputs" do
        
        it "create a category" do
          category_params = Fabricate.attributes_for(:category)
          post :create , category: category_params
          expect(Category.count).to eq(1)
        end

        it "redirects to the categories page" do
          category_params = Fabricate.attributes_for(:category)
          post :create , category: category_params
          expect(response).to redirect_to category_path(Category.first)
        end
      end

      context "with invalid inputs" do
        it "not create a the category" do
          category_params = {name: "1"}
          post :create , category: category_params
          expect(Category.count).to eq(0)
        end

        it "renders the new template" do
          category_params = {name: "1"}
          post :create , category: category_params
          expect(response).to render_template :new
        end
        it "sets the flash message" do
          category_params = {name: "1"}
          post :create , category: category_params
          expect(flash[:error]).not_to be_blank
        end
      end

    end
  end

  describe "GET show" do
    it "sets @category" do
      category = Fabricate(:category)
      get :show, id: category.id
      expect(assigns(:category)).to eq(category)
    end
  end


end