require 'test_helper'

class Admin::WebpartsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Webpart.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Webpart.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Webpart.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to admin_webpart_url(assigns(:webpart))
  end

  def test_edit
    get :edit, :id => Webpart.first
    assert_template 'edit'
  end

  def test_update_invalid
    Webpart.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Webpart.first
    assert_template 'edit'
  end

  def test_update_valid
    Webpart.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Webpart.first
    assert_redirected_to admin_webpart_url(assigns(:webpart))
  end

  def test_destroy
    webpart = Webpart.first
    delete :destroy, :id => webpart
    assert_redirected_to admin_webparts_url
    assert !Webpart.exists?(webpart.id)
  end
end
