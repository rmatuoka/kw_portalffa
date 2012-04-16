require 'test_helper'

class UploadCategoryTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert UploadCategory.new.valid?
  end
end
