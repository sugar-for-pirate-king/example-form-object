# frozen_string_literal: true

#
# CRUD Account User
#
class AccountsController < ApplicationController
  def new
    @account_form = AccountForm.new
  end

  def create
    @account_form = AccountForm.new(account_form_params)

    return unless @account_form.save

    redirect_to account_path, notice: 'Account was created'
    sign_in(User.find_by(name: @account_form.user_name))
  end

  def show; end

  def edit
    @account_form = AccountForm.setup_by(current_user)
  end

  def update
    @account_form = AccountForm.setup_by(current_user)
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
end
