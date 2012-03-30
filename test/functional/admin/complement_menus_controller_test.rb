require 'test_helper'

class Admin::ComplementMenusControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => ComplementMenu.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    ComplementMenu.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    ComplementMenu.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to admin_complement_menu_url(assigns(:complement_menu))
  end

  def test_edit
    get :edit, :id => ComplementMenu.first
    assert_template 'edit'
  end

  def test_update_invalid
    ComplementMenu.any_instance.stubs(:valid?).returns(false)
    put :update, :id => ComplementMenu.first
    assert_template 'edit'
  end

  def test_update_valid
    ComplementMenu.any_instance.stubs(:valid?).returns(true)
    put :update, :id => ComplementMenu.first
    assert_redirected_to admin_complement_menu_url(assigns(:complement_menu))
  end

  def test_destroy
    complement_menu = ComplementMenu.first
    delete :destroy, :id => complement_menu
    assert_redirected_to admin_complement_menus_url
    assert !ComplementMenu.exists?(complement_menu.id)
  end
end
