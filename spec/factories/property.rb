FactoryBot.define do
  factory :property do
    association :user
    kind { :residential }
    deal_kind { :rent }
    state { 'SP' }
    city { 'São Paulo' }
    district { 'Morumbi' }
    zip_code { '04140000' }
    rent_value_cents { 180000 }
    sale_value_cents { 0 }
    negotiable { true }
  end

  trait :with_rooms do
    transient do
      rooms_count { 3 }
    end

    after(:create) do |property, evaluator|
      create_list(:property_room, evaluator.rooms_count, property: property)
    end
  end
end
