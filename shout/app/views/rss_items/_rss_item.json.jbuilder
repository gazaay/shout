json.extract! rss_item, :id, :item, :pubDate, :guid, :created_at, :updated_at
json.url rss_item_url(rss_item, format: :json)