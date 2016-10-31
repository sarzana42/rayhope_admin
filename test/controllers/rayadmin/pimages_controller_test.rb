require 'test_helper'

class Rayadmin::PimagesControllerTest < ActionController::TestCase
  setup do
    @pimage = pimages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pimages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pimage" do
    assert_difference('Pimage.count') do
      post :create, pimage: {  }
    end

    assert_redirected_to pimage_path(assigns(:pimage))
  end

  test "should show pimage" do
    get :show, id: @pimage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pimage
    assert_response :success
  end

  test "should update pimage" do
    patch :update, id: @pimage, pimage: {  }
    assert_redirected_to pimage_path(assigns(:pimage))
  end

  test "should destroy pimage" do
    assert_difference('Pimage.count', -1) do
      delete :destroy, id: @pimage
    end

    assert_redirected_to pimages_path
  end
end
