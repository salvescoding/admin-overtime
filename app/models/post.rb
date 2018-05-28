class Post < ApplicationRecord
  belongs_to :user
  validates_presence_of :date, :rationale, :overtime_request
  validates :overtime_request, numericality: { greater_than: 0.0 }
  enum status: { submitted: 0, approved: 1, rejected: 2 }


  def self.posts_by(user)
    order(created_at: :desc).where(user: user)
  end

end
