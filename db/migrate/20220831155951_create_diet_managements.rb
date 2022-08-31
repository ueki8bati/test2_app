class CreateDietManagements < ActiveRecord::Migration[5.2]
  def change
    create_table :diet_managements do |t|
      t.string :name
      t.string :menu

      t.timestamps
    end
  end
end
