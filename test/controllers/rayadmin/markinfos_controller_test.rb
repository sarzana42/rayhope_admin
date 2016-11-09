require 'test_helper'

class Rayadmin::MarkinfosControllerTest < ActionController::TestCase
  setup do
    @markinfo = markinfos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:markinfos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create markinfo" do
    assert_difference('Markinfo.count') do
      post :create, markinfo: {  }
    end

    assert_redirected_to markinfo_path(assigns(:markinfo))
  end

  test "should show markinfo" do
    get :show, id: @markinfo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @markinfo
    assert_response :success
  end

  test "should update markinfo" do
    patch :update, id: @markinfo, markinfo: {  }
    assert_redirected_to markinfo_path(assigns(:markinfo))
  end

  test "should destroy markinfo" do
    assert_difference('Markinfo.count', -1) do
      delete :destroy, id: @markinfo
    end

    assert_redirected_to markinfos_path
  end
end
