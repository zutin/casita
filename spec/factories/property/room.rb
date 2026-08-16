FactoryBot.define do
  factory :property_room, class: 'Property::Room' do
    association :property
    kind { :bedroom }
  end
end
