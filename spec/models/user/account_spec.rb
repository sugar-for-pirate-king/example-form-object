require 'rails_helper'

RSpec.describe User::Account, type: :model do
  it 'is valid with user, bank and number' do
    user = build(:user, name: 'pquest')
    bank = build(:bank, name: 'BCA')

    user_account = build(:user_account, user: user, bank: bank, number: '123523')

    expect(user_account).to be_valid
  end
end
