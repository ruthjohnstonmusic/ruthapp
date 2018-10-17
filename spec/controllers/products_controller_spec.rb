require 'rails_helper'

describe ProductsController, type: :controller do
  before do
    @product = FactoryBot.create(:product)
    @user = FactoryBot.create(:user)
    @admin = FactoryBot.create(:admin)
  end

  context 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

  context 'GET #show' do
    it 'renders the product page' do
      get :show, params: {id: @product}
      expect(response).to be_ok
    end
  end

  describe 'GET #new' do
      context 'when admin is logged in' do
        before do
          sign_in @admin
        end
         it 'renders the product new form' do
          get :new
          expect(response).to be_ok
        end
      end

       context 'when regular user is logged in' do
        before do
          sign_in @user
        end
         it 'redirects to products index' do
          get :new
          expect(response).to redirect_to(products_url)
        end
      end
    end

    describe 'GET #edit' do
      context 'when admin is logged in' do
        before do
          sign_in @admin
        end
         it 'renders the product edit form' do
          get :edit, params: {id: @product}
          expect(response).to be_ok
        end
      end

       context 'when regular user is logged in' do
        before do
          sign_in @user
        end
         it 'redirects to products index' do
          get :edit, params: {id: @product}
          expect(response).to redirect_to(products_url)
        end
      end
    end

    describe 'POST #create' do
      context 'when the new product is valid' do
        it 'creates the product successfully' do
          post :create, params: {  product: @product.attributes }
        end
      end
    end

    describe 'PATCH/PUT #update' do
      context 'when product is successfully updated' do
        it 'updates the product' do
          article_params = FactoryBot.attributes_for(:product)
          expect put :update, params: {id: @product.id, product: article_params }
          expect(response).to redirect_to(products_url)
        end
      end
    end

    describe 'DELETE #destroy' do
      context 'when admin deletes a product' do
        it 'deletes the product' do
         delete :destroy, params: { id: @product.id }
         expect(response).to redirect_to(products_url)
        end
      end
    end

end
