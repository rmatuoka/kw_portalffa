class Guide < ActiveRecord::Base
  attr_accessible :name, :department, :address, :district, :city, :state, :zip_code, :phone, :fax, :email, :internet, :obs, :guide_type_id, :reminder, :mail, :year, :active
end
