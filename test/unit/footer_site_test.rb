require 'test_helper'

class FooterSiteTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert FooterSite.new.valid?
  end
end
