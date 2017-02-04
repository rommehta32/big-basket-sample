class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, presence: true

  def is_customer?
    self.type == 'Customer'
  end

  def is_admin?
    self.type == 'Administrator'
  end
end
