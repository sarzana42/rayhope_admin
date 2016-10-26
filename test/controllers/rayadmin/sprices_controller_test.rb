require 'test_helper'

class Rayadmin::SpricesControllerTest < ActionController::TestCase
  setup do
    @sprice = sprices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sprices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sprice" do
    assert_difference('Sprice.count') do
      post :create, sprice: {  }
    end

    assert_redirected_to sprice_path(assigns(:sprice))
  end

  test "should show sprice" do
    get :show, id: @sprice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sprice
    assert_response :success
  end

  test "should update sprice" do
    patch :update, id: @sprice, sprice: {  }
    assert_redirected_to sprice_path(assigns(:sprice))
  end

  test "should destroy sprice" do
    assert_difference('Sprice.count', -1) do
      delete :destroy, id: @sprice
    end

    assert_redirected_to sprices_path
  end
end
