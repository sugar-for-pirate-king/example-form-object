# frozen_string_literal: true

class User < ApplicationRecord
  has_one :account

  validates :name, presence: true
end
