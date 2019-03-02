# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Update Account' do
  context 'with valid params' do
    let(:user) { create(:user) }
    let(:bank) { create(:bank) }
    let!(:user_account) { create(:user_account, user: user, bank: bank) }
    # Create BRI Bank
    let!(:bank) { create(:bank, name: 'BRI') }

    it 'is updated the account' do
      page.set_rack_session(user_id: user.id)

      visit account_path

      click_link 'Edit'

      fill_in :account_form_user_name, with: 'Pquest updated'
      fill_in :account_form_user_phone_number, with: '99999121212'
      select 'BRI', from: :account_form_account_type
      fill_in :account_form_account_number, with: '1122221111'

      click_button 'Submit'

      expect(page).to have_content 'Account was updated'

      expect(page).to have_text 'Name', 'Pquest updated'
      expect(page).to have_text 'Phone Number', '99999121212'
      expect(page).to have_text 'Account Type', 'BRI'
      expect(page).to have_text 'Account Number', '1122221111'
    end
  end
end
