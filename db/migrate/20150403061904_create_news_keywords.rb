class CreateNewsKeywords < ActiveRecord::Migration
  def change
    create_table :news_keywords do |t|
      t.integer :keyword_id
      t.integer :news_id
      t.integer :head_count, :default => 0
      t.string :keyword_head_position
      t.integer :desc_count, :default => 0
      t.string :keyword_desc_position
      t.integer :ready_sign

      t.timestamps
    end
  end
end
