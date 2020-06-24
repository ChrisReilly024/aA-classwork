class Nulls < ActiveRecord::Migration[5.2]
  def change
  end
  add_index :users, :session_tokens, unique: true
end

