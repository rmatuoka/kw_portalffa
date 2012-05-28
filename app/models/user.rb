class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.login_field = 'email'
  end
  
  acts_as_authorization_subject
  
  scoped_search :on => [:name, :last_name, :email]
  has_many :carts
  has_many :orders
  
  validates_presence_of :name
  validates_exclusion_of :name, :in => I18n.t('system_record.name')
  validates_presence_of :cpf
  validates_exclusion_of :cpf, :in => I18n.t('system_record.cpf')  
  validates_uniqueness_of :cpf
  validates_presence_of :rg
  validates_exclusion_of :rg, :in => I18n.t('system_record.rg')  
  validates_presence_of :cidade
  validates_exclusion_of :cidade, :in => I18n.t('system_record.cidade')  
  validates_presence_of :estado
  validates_exclusion_of :estado, :in => I18n.t('system_record.estado')
  validates_presence_of :email
  validates_exclusion_of :email, :in => I18n.t('system_record.email')
  validates_presence_of :date_of_birth, :on => :create
  validate :check_over_18, :on => :create
  
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
  
  def age(as_at = Time.now)
    as_at = as_at.utc.to_date if as_at.respond_to?(:utc)
    as_at.year - date_of_birth.year - ((as_at.month > date_of_birth.month || (as_at.month == date_of_birth.month && as_at.day >= date_of_birth.day)) ? 0 : 1)
  end
  
  def check_over_18
    errors.add(:date_of_birth, I18n.t("activerecord.errors.messages.check_over_18")) if age < 18
  end
  
end

