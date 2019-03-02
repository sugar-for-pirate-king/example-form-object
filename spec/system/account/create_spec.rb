# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Create Account', type: :system do
  let!(:bca) { create(:bank, name: 'BCA') }

  context 'with valid params' do
    let(:valid_params) do
      {
        user_name: 'Pquest',
        user_phone_number: '082310205904',
        account_type: 'BCA',
        account_number: '10923810293'
      }
    end

    it 'creates the account' do
      visit '/account/new'

      submit_account_form_with(valid_params)

      expect(page).to have_text 'Account was created'
    end
  end

  context 'with invalid params' do
    let(:invalid_params) do
      {
        user_name: nil,
        user_phone_number: '082310205904',
        account_type: 'BCA',
        account_number: '10923810293'
      }
    end

    it 'is returns errors' do
      visit '/account/new'

      submit_account_form_with(invalid_params)

      expect(page).to have_text "User name can't be blank"
    end
  end
end
