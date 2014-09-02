class Goal < ActiveRecord::Base
  belongs_to :user
  after_initialize :set_goal_status
  
  validates :title, :body, :permission, :status, :user_id, presence: true
  
  def set_goal_status
    self.status = "In Progress"
  end  
end
