# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


User.create!([
  { email: 'user1@email.com', password: 'password' },
  { email: 'user2@email.com', password: 'password' },
  { email: 'user3@email.com', password: 'password' }
])

Property.create!([
  { user_id: User.first.id, kind: 0, deal_kind: 0, state: 'SP', city: 'São Paulo', district: 'Morumbi', zip_code: '04140000', rent_value_cents: 180000, sale_value_cents: 0, negotiable: true },
  { user_id: User.second.id, kind: 1, deal_kind: 2, state: 'RJ', city: 'Rio de Janeiro', district: 'Leblon', zip_code: '22451030', rent_value_cents: 300000, sale_value_cents: 25000000, negotiable: false },
  { user_id: User.third.id, kind: 0, deal_kind: 1, state: 'MG', city: 'Belo Horizonte', district: 'Centro', zip_code: '30130955', rent_value_cents: 0, sale_value_cents: 200000000, negotiable: true }
])
