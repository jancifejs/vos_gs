require 'test_helper'

class ServersControllerTest < ActionController::TestCase
  setup do
    @gameserver = servers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gameservers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create server" do
    assert_difference('Server.count') do
      post :create, gameserver: {  }
    end

    assert_redirected_to server_path(assigns(:gameserver))
  end

  test "should show server" do
    get :show, id: @gameserver
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gameserver
    assert_response :success
  end

  test "should update server" do
    patch :update, id: @gameserver, gameserver: {  }
    assert_redirected_to server_path(assigns(:gameserver))
  end

  test "should destroy server" do
    assert_difference('Server.count', -1) do
      delete :destroy, id: @gameserver
    end

    assert_redirected_to servers_path
  end
end
