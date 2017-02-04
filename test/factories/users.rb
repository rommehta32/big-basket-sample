FactoryGirl.define do

  sequence :email do |n|
    "person#{n}@kodelounge.com"
  end

  factory :user do
    email
    password 'Abc@1234'
    name 'User'
    type 'Customer'
  end

  factory :admin_user, class: Administrator do
    email
    password 'Abc@1234'
    name 'Admin'
    type 'Administrator'
  end
end