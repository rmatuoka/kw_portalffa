require 'test_helper'

class Admin::FooterSitesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => FooterSite.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    FooterSite.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    FooterSite.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to admin_footer_site_url(assigns(:footer_site))
  end

  def test_edit
    get :edit, :id => FooterSite.first
    assert_template 'edit'
  end

  def test_update_invalid
    FooterSite.any_instance.stubs(:valid?).returns(false)
    put :update, :id => FooterSite.first
    assert_template 'edit'
  end

  def test_update_valid
    FooterSite.any_instance.stubs(:valid?).returns(true)
    put :update, :id => FooterSite.first
    assert_redirected_to admin_footer_site_url(assigns(:footer_site))
  end

  def test_destroy
    footer_site = FooterSite.first
    delete :destroy, :id => footer_site
    assert_redirected_to admin_footer_sites_url
    assert !FooterSite.exists?(footer_site.id)
  end
end
