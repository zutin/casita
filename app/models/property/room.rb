class Property::Room < ApplicationRecord
  belongs_to :property

  enum :kind, { bedroom: 0, bathroom: 1, kitchen: 2, living_room: 3, dining_room: 4, suite: 5, garage: 6 }

  validates :kind, presence: true, inclusion: { in: kinds.keys }

  scope :by_kind, ->(kind) { where(kind: kind) }
end
