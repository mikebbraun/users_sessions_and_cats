class CreateLives < ActiveRecord::Migration[5.1]
  def change
    create_table :lives do |t|
      t.string :number
      t.belongs_to :cat, foreign_key: true

      t.timestamps
    end
  end
end
