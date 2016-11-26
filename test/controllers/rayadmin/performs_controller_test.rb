require 'test_helper'

class Rayadmin::PerformsControllerTest < ActionController::TestCase
  setup do
    @perform = performs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:performs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create perform" do
    assert_difference('Perform.count') do
      post :create, perform: {  }
    end

    assert_redirected_to perform_path(assigns(:perform))
  end

  test "should show perform" do
    get :show, id: @perform
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @perform
    assert_response :success
  end

  test "should update perform" do
    patch :update, id: @perform, perform: {  }
    assert_redirected_to perform_path(assigns(:perform))
  end

  test "should destroy perform" do
    assert_difference('Perform.count', -1) do
      delete :destroy, id: @perform
    end

    assert_redirected_to performs_path
  end
end
