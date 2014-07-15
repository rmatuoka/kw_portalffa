class Guide < ActiveRecord::Base
  attr_accessible :name, :department, :address, :district, :city, :state, :zip_code, :phone, :fax, :email, :internet, :obs, :guide_type_id, :reminder, :mail, :year, :active
  scoped_search :on => [:id, :name, :address, :city, :state, :zip_code]
  belongs_to :guide_type
  has_many :guide_visitors
  validates_presence_of :guide_type_id 
end
