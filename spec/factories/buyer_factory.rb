FactoryBot.define do
  factory :buyer do
    id { 1 }
    email { 'testbuyer@gmail.com' }
    password { 'password' }
    account_type { 'buyer' }
    admin_id { :admin }
  end
end
