require 'test_helper'

class GuideTypeTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert GuideType.new.valid?
  end
end
