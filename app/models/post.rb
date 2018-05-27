class Post < ApplicationRecord
  belongs_to :user
  validates_presence_of :date, :rationale
  enum status: { submitted: 0, approved: 1, rejected: 2 }


  def self.posts_by(user)
    order(created_at: :desc).where(user: user)
  end

end
