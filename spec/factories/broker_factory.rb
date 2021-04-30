FactoryBot.define do
  factory :broker do
    password { 'password' }
    account_type { 'broker' }
    association :admin
    confirmed_at { 'Sun, 25 Apr 2021 15:48:03.330499000 CST +08:00' }
    confirmation_token { 'U3dfFZuim_uBNPhyAEzW' }

    factory :broker_one do
      broker_name { 'Test Broker One' }
      id { 1 }
      email { 'testbroker1@gmail.com' }
    end

    factory :broker_two do
      broker_name { 'Test Broker Two' }
      id { 2 }
      email { 'testbroker2@gmail.com' }
    end
  end
end
