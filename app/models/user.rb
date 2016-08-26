class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  enum role: [:standard, :premium, :admin]
  
  has_many :wikis
  has_many :collaborations
  has_many :shared_wikis, through: :collaborations, source: :wiki
  
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
