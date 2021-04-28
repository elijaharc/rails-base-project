FactoryBot.define do
  factory :buyer do
    id { 1 }
    email { 'testbuyer@gmail.com' }
    password { 'password' }
    account_type { 'buyer' }
    association :admin
    confirmed_at { 'Sun, 25 Apr 2021 15:48:03.330499000 CST +08:00' }
    confirmation_token { 'U3dfFZuim_uBNPhyAEzW' }
  end
end
