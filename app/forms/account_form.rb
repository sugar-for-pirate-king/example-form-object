# frozen_string_literal: true

#
# Class for handing Account Form
#
class AccountForm
  include ActiveModel::Model

  attr_accessor :user_name, :user_phone_number, :account_type, :account_number

  def save
    user = User.create!(name: user_name, phone_number: user_phone_number)
    User::Account.create!(
      user: user,
      bank: Bank.find_by(id: account_type),
      number: account_number)
  end
end
