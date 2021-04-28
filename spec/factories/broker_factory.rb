FactoryBot.define do
    factory :broker do
      id { 1 }
      broker_name { "Test Broker" }
      email { "testbroker@gmail.com" }
      password { "password" }
      account_type { "broker" }
      admin_id { 1 }
      confirmed_at { "Sun, 25 Apr 2021 15:48:03.330499000 CST +08:00" }
      confirmation_token { "U3dfFZuim_uBNPhyAEzW" }
    end
  end