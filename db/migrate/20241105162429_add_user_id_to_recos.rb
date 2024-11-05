class AddUserIdToRecos < ActiveRecord::Migration[7.0]
  def change
    add_reference :recos, :user, null: false, foreign_key: true
  end
end
