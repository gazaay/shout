class CreateRssChannels < ActiveRecord::Migration
  def change
    create_table :rss_channels do |t|
      t.string :title
      t.string :link
      t.string :description
      t.string :language
      t.string :blogChannel
      t.string :copyright
      t.string :lastBuildDate
      t.string :docs
      t.string :generator
      t.string :category
      t.string :managingEditor
      t.string :webMaster

      t.timestamps null: false
    end
  end
end
