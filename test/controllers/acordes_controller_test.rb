require 'test_helper'

class AcordesControllerTest < ActionController::TestCase
  setup do
    @acorde = acordes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:acordes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create acorde" do
    assert_difference('Acorde.count') do
      post :create, acorde: { acorde: @acorde.acorde, album_id: @acorde.album_id, cantante_id: @acorde.cantante_id, descripcion: @acorde.descripcion, nombre: @acorde.nombre }
    end

    assert_redirected_to acorde_path(assigns(:acorde))
  end

  test "should show acorde" do
    get :show, id: @acorde
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @acorde
    assert_response :success
  end

  test "should update acorde" do
    patch :update, id: @acorde, acorde: { acorde: @acorde.acorde, album_id: @acorde.album_id, cantante_id: @acorde.cantante_id, descripcion: @acorde.descripcion, nombre: @acorde.nombre }
    assert_redirected_to acorde_path(assigns(:acorde))
  end

  test "should destroy acorde" do
    assert_difference('Acorde.count', -1) do
      delete :destroy, id: @acorde
    end

    assert_redirected_to acordes_path
  end
end
