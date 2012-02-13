require 'test_helper'

class WebmoduleTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Webmodule.new.valid?
  end
end
