class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.string :image
      t.references :user, null: false, foreign_key: true
      t.string :people

      t.timestamps
    end
  end
end
