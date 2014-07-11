require 'test_helper'

class Admin::GuideTypesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => GuideType.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    GuideType.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    GuideType.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to admin_guide_type_url(assigns(:guide_type))
  end

  def test_edit
    get :edit, :id => GuideType.first
    assert_template 'edit'
  end

  def test_update_invalid
    GuideType.any_instance.stubs(:valid?).returns(false)
    put :update, :id => GuideType.first
    assert_template 'edit'
  end

  def test_update_valid
    GuideType.any_instance.stubs(:valid?).returns(true)
    put :update, :id => GuideType.first
    assert_redirected_to admin_guide_type_url(assigns(:guide_type))
  end

  def test_destroy
    guide_type = GuideType.first
    delete :destroy, :id => guide_type
    assert_redirected_to admin_guide_types_url
    assert !GuideType.exists?(guide_type.id)
  end
end
