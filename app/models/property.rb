class Property < ApplicationRecord
  belongs_to :user

  enum :kind, { residential: 0, commercial: 1 }
  enum :deal_kind, { rent: 0, sale: 1, rent_and_sale: 2 }

  validates :kind, presence: true, inclusion: { in: kinds.keys }
  validates :deal_kind, presence: true, inclusion: { in: deal_kinds.keys }
  validates :state, presence: true, length: { is: 2 }, inclusion: { in: %w[AC AL AP AM BA CE DF ES GO MA MT MS MG PA PB PR PE PI RJ RN RS RO RR SC SP SE TO] }
  validates :city, presence: true, length: { maximum: 100 }
  validates :district, presence: true, length: { maximum: 100 }
  validates :zip_code, presence: true, length: { maximum: 10 }, numericality: { only_integer: true }
  validates :rent_value_cents, presence: { if: -> { deal_kind == :rent || deal_kind == :rent_and_sale } }, numericality: { greater_than_or_equal_to: 0 }
  validates :sale_value_cents, presence: { if: -> { deal_kind == :sale || deal_kind == :rent_and_sale } }, numericality: { greater_than_or_equal_to: 0 }

  scope :by_kind, ->(kind) { where(kind: kind) }
  scope :by_deal_kind, ->(deal_kind) { where(deal_kind: deal_kind) }
  scope :by_state, ->(state) { where(state: state) }
  scope :by_city, ->(city) { where(city: city) }
  scope :by_district, ->(district) { where(district: district) }
  scope :by_rent_value_range, ->(min, max) { where(rent_value_cents: min..max) }
  scope :by_sale_value_range, ->(min, max) { where(sale_value_cents: min..max) }
  scope :by_negotiable, ->(negotiable) { where(negotiable: negotiable) }
end
