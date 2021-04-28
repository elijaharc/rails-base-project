FactoryBot.define do
  factory :admin do
    id { 1 }
    email { 'admin@admin.com' }
    password { 'password' }
    account_type { 'admin' }
  end
end
