require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with name and phone number' do
    user = build(:user, name: 'Pquest', phone_number: '082310204903')
    expect(user).to be_valid
  end
end
