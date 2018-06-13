class PagesController < ApplicationController

  def home
    if admin_types.include?(current_user.type)
      @pending_approvals = Post.submitted
      @recent_audit = AuditLog.last(10)
    else
      @pending_audit_logs = current_user.audit_logs
    end
  end


end
