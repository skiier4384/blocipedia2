class Wiki < ActiveRecord::Base
  belongs_to :user
  
  scope :visible_to, -> (user) { user ? all : where(private: false) }
  
  def private?
    self.private
  end
end
