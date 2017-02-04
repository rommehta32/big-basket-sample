require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  def setup
    @admin = create(:admin_user)
    @customer = create(:user)
    @item = create(:item, updated_by: @admin.id)
  end

  test 'any user can visit index' do
    sign_in @admin
    get :index
    assert_response :success
    sign_out @admin

    sign_in @customer
    get :index
    assert_response :success
    sign_out @customer
  end

  test 'customer can not create or update item' do
    sign_in @customer
    get :new
    assert_redirected_to root_path

    get :edit, id: @item.id
    assert_redirected_to root_path
  end

  test 'admin can create item' do
    sign_in @admin
    get :new
    assert_response :success
    assert_difference 'Item.count' do
      post :create, item: {name: 'New item', quantity: '100 Gm', unit_price: 100.50}
    end
  end

  test 'admin can update any item' do
    sign_in @admin
    get :edit, id: @item.id
    assert_response :success
    assert_no_difference 'Item.count' do
      put :update,id: @item.id, item: {id: @item.id, name: 'Updated item', quantity: '200 Gm', unit_price: 200.50}
    end
    assert_equal 'Updated item', @item.reload.name
    assert_not_equal 'item', @item.reload.name
    assert_equal '200 Gm', @item.reload.quantity
    assert_not_equal '100 Gm', @item.reload.quantity
    assert_equal 200.50, @item.reload.unit_price
    assert_not_equal 100.50, @item.reload.unit_price
  end

  test 'admin can destroy any item' do
    sign_in @admin
    assert_difference 'Item.count', -1 do
      delete :destroy,id: @item.id
    end
  end
end
