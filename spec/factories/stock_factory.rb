FactoryBot.define do
  factory :stock do
    ticker { 'GOOG' }
    name { 'Alphabet Inc.' }
    last_price { 1 }
    quantity { 1 }
    added_by { 1 }
  end
end
