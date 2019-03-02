# frozen_string_literal: true

module AccountSupport
  def submit_account_form_with(params)
    fill_in :account_form_user_name, with: params[:user_name]
    fill_in :account_form_user_phone_number, with: params[:user_phone_number]
    select params[:account_type], from: :account_form_account_type
    fill_in :account_form_account_number, with: params[:account_number]

    click_button 'Submit'
  end
end

RSpec.configure do |config|
  config.include AccountSupport
end
