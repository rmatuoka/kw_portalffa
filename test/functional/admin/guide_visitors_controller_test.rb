require 'test_helper'

class Admin::GuideVisitorsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => GuideVisitor.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    GuideVisitor.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    GuideVisitor.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to admin_guide_visitor_url(assigns(:guide_visitor))
  end

  def test_edit
    get :edit, :id => GuideVisitor.first
    assert_template 'edit'
  end

  def test_update_invalid
    GuideVisitor.any_instance.stubs(:valid?).returns(false)
    put :update, :id => GuideVisitor.first
    assert_template 'edit'
  end

  def test_update_valid
    GuideVisitor.any_instance.stubs(:valid?).returns(true)
    put :update, :id => GuideVisitor.first
    assert_redirected_to admin_guide_visitor_url(assigns(:guide_visitor))
  end

  def test_destroy
    guide_visitor = GuideVisitor.first
    delete :destroy, :id => guide_visitor
    assert_redirected_to admin_guide_visitors_url
    assert !GuideVisitor.exists?(guide_visitor.id)
  end
end
