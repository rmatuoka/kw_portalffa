require 'test_helper'

class TicketCategoryTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert TicketCategory.new.valid?
  end
end
