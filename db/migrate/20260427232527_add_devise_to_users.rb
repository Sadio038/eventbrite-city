# frozen_string_literal: true
class AddDeviseToUsers < ActiveRecord::Migration[7.2]
  def change
    change_table :users do |t|
      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
