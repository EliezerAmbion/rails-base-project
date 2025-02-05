# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = Admin.create_or_find_by(email: "admin@email.com", password: "1234567", password_confirmation: "1234567")
client = IEX::Api::Client.new(
    publishable_token: Rails.application.credentials.iex_cloud[:api_key],
    secret_token: Rails.application.credentials.iex_cloud[:secret_key],
    endpoint: 'https://cloud.iexapis.com/v1'
)
symbols = client.ref_data_symbols()

symbols.shuffle.slice(0,30).each do |symbol|
    quote = client.quote(symbol.symbol)
    company = client.company(symbol.symbol)
    logo = client.logo(symbol.symbol)

    Stock.create(symbol: symbol.symbol, image: logo.url, company_name: company.company_name)
end

