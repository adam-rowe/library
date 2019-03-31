class CreateMagazines < ActiveRecord::Migration[5.2]
  def change
    create_table :magazines do |t|
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
