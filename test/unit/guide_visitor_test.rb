require 'test_helper'

class GuideVisitorTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert GuideVisitor.new.valid?
  end
end
