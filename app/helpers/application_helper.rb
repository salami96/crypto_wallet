module ApplicationHelper

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
