require 'rails_helper'

describe ProductsController, :type => :controller do

  before do
    @admin = FactoryGirl.create(:admin_user)
    @product = FactoryGirl.create(:product)
  end

  describe "GET #index" do
      before do
        @product = FactoryGirl.create(:product)
      end

      it "all products are shown" do
        get :index

        expect(response).to have_http_status(200)
        expect(assigns(:products)).to eq Product.all
      end

      it 'renders the :index view' do
        get :index
        expect(response).to render_template :index
      end

  end

  describe "GET #show" do

    it "correct Product is shown" do
      get :show, params:{id: @product.id}

      expect(response).to have_http_status(200)
      expect(assigns(:product)).to eq @product

    end

    it 'renders the #show view' do
      get :show, params:{id: @product.id}
      expect(response).to render_template :show
    end

  end

  describe "GET #new" do

    before do
      sign_in @admin
    end

    it 'renders the :new view' do
      get :new
      expect(response).to have_http_status(200)
      expect(response).to render_template :new
    end

  end

  describe 'GET #edit' do

    before do
      sign_in @admin
    end

    it 'renders the #edit template' do
      get :edit, params:{id: @product.id}

      expect(response).to have_http_status(200)
      expect(response).to render_template :edit
    end

  end

  describe 'POST #create' do

    before do
      sign_in @admin
    end

    context 'Sending valid data' do

      it 'creates a new product' do
        expect{post :create, product: FactoryGirl.attributes_for(:product)}.to change(Product, :count).by(1)
      end

      it 'redirects to products#index' do
        post :create, product: FactoryGirl.attributes_for(:product)
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(product_path(Product.last))
      end

    end

  end

  describe 'PUT #update' do

    before do
      sign_in @admin
    end

    context 'valid attributes' do

      it 'located the requested @product' do
        put :update, id: @product, product: FactoryGirl.attributes_for(:product)
        expect(assigns(:product)).to eq(@product)
      end

      it 'changes attributes of @product' do
        put :update, id: @product, product:\
        FactoryGirl.attributes_for(:product, name: 'updated_product', description:'updated_product')
        @product.reload
        expect(@product.name).to eq('updated_product')

      end

      it 'redirects to updated product' do
        put :update, id: @product, product:\
        FactoryGirl.attributes_for(:product, name: 'updated_product', description:'updated_product')

        expect(response).to have_http_status(302)
        expect(response).to redirect_to(products_path)

      end

    end


  end

  describe "DELETE #destroy" do

    it "deletes a product" do
      delete :destroy, params:{id: @product.id}

      expect{@product.destroy}.to change(Product, :count).by(-1)

    end

  end

end