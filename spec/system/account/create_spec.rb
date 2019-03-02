# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Create Account', type: :system do
  let!(:bca) { create(:bank, name: 'BCA') }
  let(:valid_params) do
    {
      user_name: 'Pquest',
      user_phone_number: '082310205904',
      account_type: 'BCA',
      account_number: '10923810293'
    }
  end

  context 'with valid params' do
    it 'creates the account' do
      visit '/account/new'

      submit_account_form_with(valid_params)

      expect(page).to have_text 'Account was created'
    end
  end
end
