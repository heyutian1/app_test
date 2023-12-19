module ApplicationHelper
  def format_datetime(datetime)
    datetime.present? ? datetime.localtime.strftime("%Y-%m-%d %H:%M") : '—'
  end
end
