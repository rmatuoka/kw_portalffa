require 'test_helper'

class TicketTypeTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert TicketType.new.valid?
  end
end
