class CreateRssItems < ActiveRecord::Migration
  def change
    create_table :rss_items do |t|
      t.string :item
      t.string :pubDate
      t.string :guid

      t.timestamps null: false
    end
  end
end
