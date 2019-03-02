# frozen_string_literal: true

#
# Application Helper
#
module ApplicationHelper
  #
  # To create session of passed user
  #
  # @param [<object>] user current_user
  #
  #
  def sign_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
