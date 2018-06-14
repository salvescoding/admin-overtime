class Post < ApplicationRecord
  belongs_to :user
  validates_presence_of :date, :rationale, :overtime_request
  validates :overtime_request, numericality: { greater_than: 0.0 }
  enum status: { submitted: 0, approved: 1, rejected: 2 }
  after_save :update_audit_log

  def self.posts_by(user)
    order(created_at: :desc).where(user: user)
  end

  private

    def update_audit_log
      audit_log = AuditLog.where(user_id: self.user_id, start_date: (self.date - 7.days..self.date)).last
      if audit_log
        audit_log.confirmed!
      end
    end

end
