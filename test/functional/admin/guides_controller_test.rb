require 'test_helper'

class Admin::GuidesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Guide.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Guide.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Guide.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to admin_guide_url(assigns(:guide))
  end

  def test_edit
    get :edit, :id => Guide.first
    assert_template 'edit'
  end

  def test_update_invalid
    Guide.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Guide.first
    assert_template 'edit'
  end

  def test_update_valid
    Guide.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Guide.first
    assert_redirected_to admin_guide_url(assigns(:guide))
  end

  def test_destroy
    guide = Guide.first
    delete :destroy, :id => guide
    assert_redirected_to admin_guides_url
    assert !Guide.exists?(guide.id)
  end
end
