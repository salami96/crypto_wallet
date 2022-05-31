require 'tty-spinner'

namespace :dev do
  desc "Setup development environment"
  task setup: :environment do
    actions = ['drop', 'create', 'migrate', 'seed']
    if Rails.env.development?
      actions.each do |action|
        show_spinner(action.upcase) { %x(rails db:#{action}) }
      end
    else
      puts("✖ Você não está em ambiente de desenvolvimento, está em: #{Rails.env}")
    end
  end

  private

  def show_spinner(init_msg)
    spinner = TTY::Spinner.new(":spinner rodando: #{init_msg} ...", format: :spin_3)
    spinner.auto_spin
    yield
    spinner.success('(Feito)')
  end
end
