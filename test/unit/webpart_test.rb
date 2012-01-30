require 'test_helper'

class WebpartTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Webpart.new.valid?
  end
end
