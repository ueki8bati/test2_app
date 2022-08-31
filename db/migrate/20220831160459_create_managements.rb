class CreateManagements < ActiveRecord::Migration[5.2]
  def change
    create_table :managements do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :menu

      t.timestamps
    end
  end
end
