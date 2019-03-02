# frozen_string_literal: true

#
# Class for handing Account Form
#
class AccountForm
  include ActiveModel::Model

  attr_accessor :user_name, :user_phone_number, :account_type, :account_number

  validates :user_name, presence: true

  def self.setup_by(current_user)
    params = {}
    params[:user_name] = current_user.name
    params[:user_phone_number] = current_user.phone_number
    params[:account_type] = current_user.account.bank.id
    params[:account_number] = current_user.account.number
    AccountForm.new(params)
  end

  def save
    return unless valid?

    user = User.create!(name: user_name, phone_number: user_phone_number)
    User::Account.create!(
      user: user,
      bank: Bank.find_by(id: account_type),
      number: account_number
    )
  end

  def update(params)
    user = User.find_by(name: user_name)
    user.update!(name: params[:user_name], phone_number: params[:user_phone_number])
    account = User::Account.find_by(user: user)
    account.update!(bank: Bank.find_by(id: account_type), number: params[:account_number])
  end
end
