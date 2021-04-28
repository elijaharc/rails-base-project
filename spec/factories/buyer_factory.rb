FactoryBot.define do
    factory :buyer do
      email { "testbuyer@gmail.com" }
      password { "password" }
      account_type { "buyer" }
      admin_id { :admin }
    end
  end