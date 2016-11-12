require 'test_helper'

class Rayadmin::KamonsControllerTest < ActionController::TestCase
  setup do
    @kamon = kamons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kamons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kamon" do
    assert_difference('Kamon.count') do
      post :create, kamon: {  }
    end

    assert_redirected_to kamon_path(assigns(:kamon))
  end

  test "should show kamon" do
    get :show, id: @kamon
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @kamon
    assert_response :success
  end

  test "should update kamon" do
    patch :update, id: @kamon, kamon: {  }
    assert_redirected_to kamon_path(assigns(:kamon))
  end

  test "should destroy kamon" do
    assert_difference('Kamon.count', -1) do
      delete :destroy, id: @kamon
    end

    assert_redirected_to kamons_path
  end
end
