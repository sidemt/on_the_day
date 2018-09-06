module ApplicationHelper
  # Returns the full title of the page
  def full_title(page_title = '')
    base_title = 'On The Day'
    if page_title.empty?
      base_title
    else
      base_title + ' | ' + page_title
    end
  end

  def get_tweet_id
    tw = Tweet.new
    tw.search_tweets
  end
end
