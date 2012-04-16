require 'test_helper'

class Admin::TicketCategoriesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => TicketCategory.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    TicketCategory.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    TicketCategory.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to admin_ticket_category_url(assigns(:ticket_category))
  end

  def test_edit
    get :edit, :id => TicketCategory.first
    assert_template 'edit'
  end

  def test_update_invalid
    TicketCategory.any_instance.stubs(:valid?).returns(false)
    put :update, :id => TicketCategory.first
    assert_template 'edit'
  end

  def test_update_valid
    TicketCategory.any_instance.stubs(:valid?).returns(true)
    put :update, :id => TicketCategory.first
    assert_redirected_to admin_ticket_category_url(assigns(:ticket_category))
  end

  def test_destroy
    ticket_category = TicketCategory.first
    delete :destroy, :id => ticket_category
    assert_redirected_to admin_ticket_categories_url
    assert !TicketCategory.exists?(ticket_category.id)
  end
end
