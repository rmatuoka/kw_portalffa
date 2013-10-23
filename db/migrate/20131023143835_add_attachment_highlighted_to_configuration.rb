class AddAttachmentHighlightedToConfiguration < ActiveRecord::Migration
  def self.up
    add_column :configurations, :highlighted_file_name, :string
    add_column :configurations, :highlighted_content_type, :string
    add_column :configurations, :highlighted_file_size, :integer
    add_column :configurations, :highlighted_updated_at, :datetime
  end

  def self.down
    remove_column :configurations, :highlighted_file_name
    remove_column :configurations, :highlighted_content_type
    remove_column :configurations, :highlighted_file_size
    remove_column :configurations, :highlighted_updated_at
  end
end
