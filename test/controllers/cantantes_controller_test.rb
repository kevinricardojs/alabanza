require 'test_helper'

class CantantesControllerTest < ActionController::TestCase
  setup do
    @cantante = cantantes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cantantes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cantante" do
    assert_difference('Cantante.count') do
      post :create, cantante: { nombre: @cantante.nombre }
    end

    assert_redirected_to cantante_path(assigns(:cantante))
  end

  test "should show cantante" do
    get :show, id: @cantante
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cantante
    assert_response :success
  end

  test "should update cantante" do
    patch :update, id: @cantante, cantante: { nombre: @cantante.nombre }
    assert_redirected_to cantante_path(assigns(:cantante))
  end

  test "should destroy cantante" do
    assert_difference('Cantante.count', -1) do
      delete :destroy, id: @cantante
    end

    assert_redirected_to cantantes_path
  end
end
