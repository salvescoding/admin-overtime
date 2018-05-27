class Post < ApplicationRecord
  belongs_to :user
  validates_presence_of :date, :rationale
  enum status: { submitted: 0, approved: 1, rejected: 2 }


  def recent_posts
    order(created_at: :desc)
  end

end
