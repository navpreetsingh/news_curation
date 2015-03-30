class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :headline
      t.string :url
      t.integer :ready
      t.string :description

      t.timestamps
    end
  end
end
