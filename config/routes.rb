# frozen_string_literal: true

Rails.application.routes.draw do
  resource :account, except: :destroy
end
