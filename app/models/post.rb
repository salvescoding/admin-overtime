class Post < ApplicationRecord
  belongs_to :user
  validates_presence_of :date, :rationale

  def self.recent_posts
    order(created_at: :desc)
  end
end
