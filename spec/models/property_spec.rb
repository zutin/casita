require 'rails_helper'

RSpec.describe Property, type: :model do
  describe 'validations' do
    let!(:user) { create(:user) }
    let!(:property) { create(:property, user: user) }

    it 'is valid with valid attributes' do
      expect(property).to be_valid
    end

    it 'is not valid without a user' do
      property.user = nil
      expect(property).not_to be_valid
      expect(property.errors[:user]).to include("must exist")
    end

    it 'is not valid without a state' do
      property.state = ''
      expect(property).not_to be_valid
      expect(property.errors[:state]).to include("can't be blank")
    end

    it 'is not valid with an invalid state' do
      property.state = 'XX'
      expect(property).not_to be_valid
      expect(property.errors[:state]).to include('is not included in the list')
    end

    it 'is not valid without a city' do
      property.city = ''
      expect(property).not_to be_valid
      expect(property.errors[:city]).to include("can't be blank")
    end

    it 'is not valid without a district' do
      property.district = ''
      expect(property).not_to be_valid
      expect(property.errors[:district]).to include("can't be blank")
    end

    it 'is not valid without a zip code' do
      property.zip_code = ''
      expect(property).not_to be_valid
      expect(property.errors[:zip_code]).to include("can't be blank")
    end

    it 'is not valid with a non-integer zip code' do
      property.zip_code = '04140-000'
      expect(property).not_to be_valid
      expect(property.errors[:zip_code]).to include('is not a number')
    end

    it 'is not valid without a rent_value_cents when deal_kind is rent or rent_and_sale' do
      property.deal_kind = :rent
      property.rent_value_cents = nil
      expect(property).not_to be_valid
      expect(property.errors[:rent_value_cents]).to include("is not a number")

      property.deal_kind = :rent_and_sale
      property.rent_value_cents = nil
      expect(property).not_to be_valid
      expect(property.errors[:rent_value_cents]).to include("is not a number")
    end

    it 'is not valid without a sale_value_cents when deal_kind is sale or rent_and_sale' do
      property.deal_kind = :sale
      property.sale_value_cents = nil
      expect(property).not_to be_valid
      expect(property.errors[:sale_value_cents]).to include("is not a number")

      property.deal_kind = :rent_and_sale
      property.sale_value_cents = nil
      expect(property).not_to be_valid
      expect(property.errors[:sale_value_cents]).to include("is not a number")
    end

    it 'is not valid with a negative rent_value_cents' do
      property.rent_value_cents = -1000
      expect(property).not_to be_valid
      expect(property.errors[:rent_value_cents]).to include("must be greater than or equal to 0")
    end

    it 'is not valid with a negative sale_value_cents' do
      property.sale_value_cents = -1000
      expect(property).not_to be_valid
      expect(property.errors[:sale_value_cents]).to include("must be greater than or equal to 0")
    end
  end
end
