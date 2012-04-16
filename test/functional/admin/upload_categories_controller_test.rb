require 'test_helper'

class Admin::UploadCategoriesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => UploadCategory.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    UploadCategory.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    UploadCategory.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to admin_upload_category_url(assigns(:upload_category))
  end

  def test_edit
    get :edit, :id => UploadCategory.first
    assert_template 'edit'
  end

  def test_update_invalid
    UploadCategory.any_instance.stubs(:valid?).returns(false)
    put :update, :id => UploadCategory.first
    assert_template 'edit'
  end

  def test_update_valid
    UploadCategory.any_instance.stubs(:valid?).returns(true)
    put :update, :id => UploadCategory.first
    assert_redirected_to admin_upload_category_url(assigns(:upload_category))
  end

  def test_destroy
    upload_category = UploadCategory.first
    delete :destroy, :id => upload_category
    assert_redirected_to admin_upload_categories_url
    assert !UploadCategory.exists?(upload_category.id)
  end
end
