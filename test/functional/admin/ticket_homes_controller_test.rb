require 'test_helper'

class Admin::TicketHomesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => TicketHome.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    TicketHome.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    TicketHome.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to admin_ticket_home_url(assigns(:ticket_home))
  end

  def test_edit
    get :edit, :id => TicketHome.first
    assert_template 'edit'
  end

  def test_update_invalid
    TicketHome.any_instance.stubs(:valid?).returns(false)
    put :update, :id => TicketHome.first
    assert_template 'edit'
  end

  def test_update_valid
    TicketHome.any_instance.stubs(:valid?).returns(true)
    put :update, :id => TicketHome.first
    assert_redirected_to admin_ticket_home_url(assigns(:ticket_home))
  end

  def test_destroy
    ticket_home = TicketHome.first
    delete :destroy, :id => ticket_home
    assert_redirected_to admin_ticket_homes_url
    assert !TicketHome.exists?(ticket_home.id)
  end
end
