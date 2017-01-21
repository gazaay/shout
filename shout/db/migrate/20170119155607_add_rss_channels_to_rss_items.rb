class AddRssChannelsToRssItems < ActiveRecord::Migration
  def change
    add_reference :rss_items, :RssChannel, index: true, foreign_key: true
  end
end
