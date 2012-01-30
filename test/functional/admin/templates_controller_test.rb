require 'test_helper'

class Admin::TemplatesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Template.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Template.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Template.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to admin_template_url(assigns(:template))
  end

  def test_edit
    get :edit, :id => Template.first
    assert_template 'edit'
  end

  def test_update_invalid
    Template.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Template.first
    assert_template 'edit'
  end

  def test_update_valid
    Template.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Template.first
    assert_redirected_to admin_template_url(assigns(:template))
  end

  def test_destroy
    template = Template.first
    delete :destroy, :id => template
    assert_redirected_to admin_templates_url
    assert !Template.exists?(template.id)
  end
end
