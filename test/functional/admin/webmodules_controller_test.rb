require 'test_helper'

class Admin::WebmodulesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Webmodule.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Webmodule.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Webmodule.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to admin_webmodule_url(assigns(:webmodule))
  end

  def test_edit
    get :edit, :id => Webmodule.first
    assert_template 'edit'
  end

  def test_update_invalid
    Webmodule.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Webmodule.first
    assert_template 'edit'
  end

  def test_update_valid
    Webmodule.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Webmodule.first
    assert_redirected_to admin_webmodule_url(assigns(:webmodule))
  end

  def test_destroy
    webmodule = Webmodule.first
    delete :destroy, :id => webmodule
    assert_redirected_to admin_webmodules_url
    assert !Webmodule.exists?(webmodule.id)
  end
end
