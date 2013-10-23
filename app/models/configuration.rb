class Configuration < ActiveRecord::Base
  #attr_accessible :email_adm, :email_compras, :email_contato, :email_imprensa, :copyright, :address, :phone, :schedule, :twitter, :facebook, :youtube
  has_attached_file :logo
  has_attached_file :highlighted
end
