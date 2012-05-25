require 'test_helper'

class TicketHomeTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert TicketHome.new.valid?
  end
end
