module ApplicationHelper
  def date_br(date)
    date.strftime "%d/%m/%Y"
  end

  def ambiente_rails
    case Rails.env
    when "development"
      "Desenvolvimento"
    when "test"
      "Teste"
    when "production"
      "Produção"
    end
  end
end
