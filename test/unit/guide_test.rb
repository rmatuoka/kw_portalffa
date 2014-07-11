require 'test_helper'

class GuideTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Guide.new.valid?
  end
end
