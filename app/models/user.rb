class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  enum role: [:standard, :premium, :admin]
  
  has_many :wikis
  
  def admin?
    self.role == "admin"
  end

  def premium?
    self.role == "premium"
  end

  def standard?
    self.role == "standard"
  end
         
end
