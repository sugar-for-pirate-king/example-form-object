# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Create Account', type: :system do
  let!(:bca) { create(:bank, name: 'BCA') }
  context 'with valid params' do
    it 'creates the account' do
      visit '/account/new'

      fill_in :account_form_user_name, with: 'Pquest'
      fill_in :account_form_user_phone_number, with: '082310205904'
      select 'BCA', from: :account_form_account_type
      fill_in :account_form_account_number, with: '10923810293'

      click_button 'Submit'

      expect(page).to have_text 'Account was created'

      expect(page).to have_text 'Name', 'Pquest'
      expect(page).to have_text 'Phone Number', '082310205904'
      expect(page).to have_text 'Account Type', 'BCA'
      expect(page).to have_text 'Account Number', '10923810293'
    end
  end
end
