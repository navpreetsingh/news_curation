class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :name
      t.integer :h1b, :default => 0
      t.integer :h1r, :default => 0
      t.integer :h2b, :default => 0
      t.integer :h2r, :default => 0
      t.integer :h3b, :default => 0
      t.integer :h3r, :default => 0
      t.integer :hg3b, :default => 0
      t.integer :hg3r, :default => 0
      t.integer :d1b, :default => 0
      t.integer :d1r, :default => 0
      t.integer :d2b, :default => 0
      t.integer :d2r, :default => 0
      t.integer :d3b, :default => 0
      t.integer :d3r, :default => 0
      t.integer :dg3b, :default => 0
      t.integer :dg3r, :default => 0
      t.integer :total, :default => 0

      t.timestamps
    end
  end
end
