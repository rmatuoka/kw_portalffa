class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.login_field = 'email'
  end
  
  acts_as_authorization_subject
  
  scoped_search :on => [:name, :last_name, :email]
  has_many :carts
  has_many :orders
  
  
  validates_presence_of :name
  validates_length_of :name, :minimum => 5
  validates_presence_of :cpf
  validates_uniqueness_of :cpf
  validates_presence_of :rg
  validates_presence_of :cidade
  validates_presence_of :estado
  validates_presence_of :email
  validates_presence_of :date_of_birth

  
  attr_writer :role
  after_save :define_role

  def role
    @role
    if self.has_role? :admin
      @role = :admin
    elsif self.has_role? :supervisor
      @role = :supervisor
    elsif self.has_role? :user
      @role = :user
    end
  end

  def define_role
    if @role
      self.has_no_roles!
      self.has_role! @role
    end
  end

  def deliver_password_reset_instructions!
    reset_perishable_token!
  end
end

