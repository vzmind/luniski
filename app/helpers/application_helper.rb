require 'rubygems'
require 'feed-normalizer'
require 'open-uri'

module ApplicationHelper
  def parse_feed(url)
    @result = []
    feed = FeedNormalizer::FeedNormalizer.parse open(url)
    @result.push(*feed.entries)
    content = "<ul>"
    @result.each do |item|
      content += "<li><div class='details'><h5><a href='%s' target='_blank'>%s</a></h5></div>" % [item.url,item.title]
      content += "</li>"
    end
    content += "</ul>"
    return content.html_safe
  end
end
