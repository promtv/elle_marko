FactoryBot.define do
  factory :clothing do
    classification { "t-shirts" }
    brand { "underarmour" }
    name { "Polo UA Matchplay" }
    price { 40 }
    material { "polyester" }
    size { "L" }
    for_whom { "for_men" }
  end
end
