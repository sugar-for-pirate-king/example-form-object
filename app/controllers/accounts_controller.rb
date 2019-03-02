# frozen_string_literal: true

#
# CRUD Account User
#
class AccountsController < ApplicationController
  before_action :account_form_setup, only: %i[edit update]

  def new
    build_account_form
  end

  def create
    build_account_form(account_form_params)

    return unless @account_form.save

    redirect_to account_path, notice: 'Account was created'
    sign_in(User.find_by(name: @account_form.user_name))
  end

  def show; end

  def edit; end

  def update
    return unless @account_form.update(account_form_params)

    redirect_to account_path, notice: 'Account was updated'
  end

  private

  def account_form_params
    params.require(:account_form).permit(
      :user_name,
      :user_phone_number,
      :account_type,
      :account_number
    )
  end

  def build_account_form(params = {})
    @account_form = AccountForm.new(params)
  end

  def account_form_setup
    @account_form = AccountForm.setup_by(current_user)
  end
end
