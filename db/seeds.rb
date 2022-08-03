require 'tty-spinner'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[
    { description: "Não se aplica", acronym: "N/a" },
    { description: "Proof of Work", acronym: "PoW" },
    { description: "Proof of Stake", acronym: "PoS" },
    { description: "Proof of Capacity", acronym: "PoC" },
].each_with_index { |mining_type, index| show_spinner("Cadastrando tipos de mineração ##{index}") { MiningType.find_or_create_by!(mining_type) } }

[
    {
        description: "Bitcoin",
        acronym:     "BTC",
        url_image:   "https://cryptologos.cc/logos/bitcoin-btc-logo.png?v=018",
        mining_type: MiningType.find_by_acronym("Pow")
    },
    {
        description: "Ethereum",
        acronym:     "ETH",
        url_image:   "https://cryptologos.cc/logos/ethereum-eth-logo.png?v=018",
        mining_type: MiningType.find_by_acronym("PoW")
    },
    {
        description: "USD Coin",
        acronym:     "USDC",
        url_image:   "https://cryptologos.cc/logos/thumbs/usd-coin.png?v=022",
        mining_type: MiningType.find_by_acronym("N/a")

    }
].each_with_index { |coin, index| show_spinner("Cadastrando moedas ##{index}") { Coin.find_or_create_by!(coin) } }

def show_spinner(init_msg)
  spinner = TTY::Spinner.new(":spinner rodando: #{init_msg} ...", format: :spin_3)
  spinner.auto_spin
  yield
  spinner.success('(Feito)')
end