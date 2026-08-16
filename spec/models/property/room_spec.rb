require 'rails_helper'

RSpec.describe Property::Room, type: :model do
  describe 'scopes' do
    let!(:property) { create(:property, :with_rooms) }
    let(:bathroom) { property.rooms.second }

    before do
      bathroom.update(kind: :bathroom)
    end

    describe '.by_kind' do
      it 'returns rooms of the specified kind' do
        expect(Property::Room.by_kind(:bathroom)).to include(bathroom)
        expect(Property::Room.by_kind(:bedroom)).not_to include(bathroom)
      end
    end
  end
end
