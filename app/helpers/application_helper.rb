module ApplicationHelper
  def formatted_date(date)
    date.present? ? I18n.l(date) : ''
  end
end
