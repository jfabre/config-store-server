require 'test_helper'

class ViewsControllerTest < ActionController::TestCase
  setup do
    @__view = __views(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:__views)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create __view" do
    assert_difference('View.count') do
      post :create, __view: { haml: @__view.haml, name: @__view.name, organization: @__view.organization }
    end

    assert_redirected_to __view_path(assigns(:__view))
  end

  test "should show __view" do
    get :show, id: @__view
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @__view
    assert_response :success
  end

  test "should update __view" do
    put :update, id: @__view, __view: { haml: @__view.haml, name: @__view.name, organization: @__view.organization }
    assert_redirected_to __view_path(assigns(:__view))
  end

  test "should destroy __view" do
    assert_difference('View.count', -1) do
      delete :destroy, id: @__view
    end

    assert_redirected_to __views_path
  end
end
