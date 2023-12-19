class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.references :school, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :kype, default: 0
      t.string :password, null: false
      t.string :confirm_password, null: false
      t.string :token, null: false 
      t.timestamps
    end
  end
end
