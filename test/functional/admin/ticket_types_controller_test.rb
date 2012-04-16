require 'test_helper'

class Admin::TicketTypesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => TicketType.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    TicketType.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    TicketType.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to admin_ticket_type_url(assigns(:ticket_type))
  end

  def test_edit
    get :edit, :id => TicketType.first
    assert_template 'edit'
  end

  def test_update_invalid
    TicketType.any_instance.stubs(:valid?).returns(false)
    put :update, :id => TicketType.first
    assert_template 'edit'
  end

  def test_update_valid
    TicketType.any_instance.stubs(:valid?).returns(true)
    put :update, :id => TicketType.first
    assert_redirected_to admin_ticket_type_url(assigns(:ticket_type))
  end

  def test_destroy
    ticket_type = TicketType.first
    delete :destroy, :id => ticket_type
    assert_redirected_to admin_ticket_types_url
    assert !TicketType.exists?(ticket_type.id)
  end
end
