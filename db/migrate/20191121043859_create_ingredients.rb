class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :name, uniqueness: true, presence: true
      t.string :description, presence: true

      t.timestamps
    end
  end
end
