# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Bank, type: :model do
  it 'is valid with name' do
    bank = build_stubbed(:bank, name: 'BCA')
    expect(bank).to be_valid
  end
end
