require 'test_helper'

class PastelsControllerTest < ActionController::TestCase
  setup do
    @pastel = pastels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pastels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pastel" do
    assert_difference('Pastel.count') do
      post :create, pastel: { nome: @pastel.nome }
    end

    assert_redirected_to pastel_path(assigns(:pastel))
  end

  test "should show pastel" do
    get :show, id: @pastel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pastel
    assert_response :success
  end

  test "should update pastel" do
    patch :update, id: @pastel, pastel: { nome: @pastel.nome }
    assert_redirected_to pastel_path(assigns(:pastel))
  end

  test "should destroy pastel" do
    assert_difference('Pastel.count', -1) do
      delete :destroy, id: @pastel
    end

    assert_redirected_to pastels_path
  end
end
