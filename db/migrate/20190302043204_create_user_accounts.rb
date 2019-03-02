class CreateUserAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :user_accounts do |t|
      t.references :user, foreign_key: true
      t.references :bank, foreign_key: true
      t.string :number

      t.timestamps
    end
  end
end
