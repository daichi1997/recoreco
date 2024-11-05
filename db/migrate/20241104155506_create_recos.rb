class CreateRecos < ActiveRecord::Migration[7.0]
  def change
    create_table :recos do |t|
      t.string :text
      t.string :title
      t.timestamps
    end
  end
end
