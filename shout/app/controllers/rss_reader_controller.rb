class RssReaderController < ApplicationController
  def SCMPFeed
    require 'json'
    require 'net/http'
    s = Net::HTTP.get_response(URI.parse('http://www.scmp.com/rss/2/feed')).body
    render :json => Hash.from_xml(s).to_json
  end
end
