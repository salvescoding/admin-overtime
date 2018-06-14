module PagesHelper
  def confirmation_date(audit)
    audit.end_date ?  audit.end_date.strftime("%d/%m/%Y") : 'Waiting to be confirmed'
  end

  def start_date(audit)
    audit.start_date.strftime("%d/%m/%Y")
  end
end
