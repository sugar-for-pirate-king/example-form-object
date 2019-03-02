# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Update Account' do
  context 'with valid params' do
    let(:user) { create(:user) }
    let(:bank) { create(:bank) }
    let!(:user_account) { create(:user_account, user: user, bank: bank) }
    # Create BRI Bank
    let!(:bank) { create(:bank, name: 'BRI') }

    let(:valid_params) do
      {
        user_name: 'Pquest updated',
        user_phone_number: '99999121212',
        account_type: 'BRI',
        account_number: '1122221111'
      }
    end

    it 'is updated the account' do
      page.set_rack_session(user_id: user.id)

      visit account_path

      click_link 'Edit'

      submit_account_form_with(valid_params)

      expect(page).to have_content 'Account was updated'

      expect(page).to have_text 'Name', 'Pquest updated'
      expect(page).to have_text 'Phone Number', '99999121212'
      expect(page).to have_text 'Account Type', 'BRI'
      expect(page).to have_text 'Account Number', '1122221111'
    end
  end
end
