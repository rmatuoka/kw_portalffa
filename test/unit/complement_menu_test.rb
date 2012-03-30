require 'test_helper'

class ComplementMenuTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert ComplementMenu.new.valid?
  end
end
