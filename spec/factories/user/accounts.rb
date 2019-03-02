FactoryBot.define do
  factory :user_account, class: 'User::Account' do
    user { nil }
    bank { nil }
    number { "MyString" }
  end
end
