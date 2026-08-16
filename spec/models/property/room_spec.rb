require 'rails_helper'

RSpec.describe Property::Room, type: :model do
  describe 'scopes' do
    let!(:property) { Property.create!(user: User.create!(email: 'user@email.com', password: 'password'), state: 'SP', city: 'São Paulo', district: 'Morumbi', zip_code: '04140000') }
    let!(:bedroom) { Property::Room.create!(property: property, kind: :bedroom) }
    let!(:bathroom) { Property::Room.create!(property: property, kind: :bathroom) }

    describe '.by_kind' do
      it 'returns rooms of the specified kind' do
        expect(Property::Room.by_kind(:bedroom)).to include(bedroom)
        expect(Property::Room.by_kind(:bedroom)).not_to include(bathroom)
      end
    end
  end
end
