class PagesController < ApplicationController
  def home
    @pending_approvals = Post.where(status: 'submitted')
    @recent_audit = AuditLog.last(10)
  end
end
