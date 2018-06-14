class AuditLogsController < ApplicationController
  def index
    @audit_logs = AuditLog.all.page(params[:page]).per(10)
    authorize @audit_logs
  end

  def confirmed
    audit_log = AuditLog.find(params[:id])
    if audit_log.confirmed!
      audit_log.update!(end_date: Date.today)
      redirect_to root_path, notice: "You have confirmed your audit log"
    else
      redirect_to root_path
    end
  end

end
