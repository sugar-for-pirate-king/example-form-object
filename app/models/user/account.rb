class User::Account < ApplicationRecord
  belongs_to :user
  belongs_to :bank
end
