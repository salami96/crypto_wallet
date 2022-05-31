require 'tty-spinner'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[
    {
        description: "Bitcoin",
        acronym:     "BTC",
        url_image:   "https://cryptologos.cc/logos/bitcoin-btc-logo.png?v=018"
    },
    {
        description: "Ethereum",
        acronym:     "ETH",
        url_image:   "https://cryptologos.cc/logos/ethereum-eth-logo.png?v=018"
    },
    {
        description: "USD Coin",
        acronym:     "USDC",
        url_image:   "https://cryptologos.cc/logos/thumbs/usd-coin.png?v=022"
    }
].each { |coin| show_spinner("Cadastrando moedas") { Coin.find_or_create_by!(coin) } }

def show_spinner(init_msg)
  spinner = TTY::Spinner.new(":spinner rodando: #{init_msg} ...", format: :spin_3)
  spinner.auto_spin
  yield
  spinner.success('(Feito)')
end