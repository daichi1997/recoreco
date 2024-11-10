class CreateRecos < ActiveRecord::Migration[7.0]
  def change
    create_table :recos do |t|
      t.string :title
      t.string :content
      t.string :image
      t.timestamps
    end
  end
end
