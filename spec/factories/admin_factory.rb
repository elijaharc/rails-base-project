FactoryBot.define do
    factory :admin do
      email { "admin@admin.com" }
      password { "password" }
      account_type { "admin" }
      id { 1 }
    end
  end