class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :headline, :limit => 1000
      t.string :url, :limit => 1000
      t.integer :ready
      t.string :description, :limit => 1000

      t.timestamps
    end
  end
end
