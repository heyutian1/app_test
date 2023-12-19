class CreateFollows < ActiveRecord::Migration[7.0]
  def change
    create_table :follows do |t|
      t.references :member, null: false, foreign_key: true
      t.integer :followable_id
      t.string :followable_type

      t.timestamps
    end
  end
end
