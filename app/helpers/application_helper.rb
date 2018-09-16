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

  # Returns Tweet IDs of search results for given day
  def get_tweet_id(day)
    tw = Tweet.new(day)
    tw.search_tweets
  end

  # Returns HTML snippet to embed the tweet of the given tweet ID
  def get_snippet(id)
    # Make an API call using 'rest-client' gem
    target_url = 'https://publish.twitter.com/oembed?' \
                 'url=https%3a%2f%2ftwitter%2ecom%2fInterior%2fstatus%2f' +
                 id.to_s + '&omit_script=true'
    response = RestClient::Request.execute(
      method: :get,
      url: target_url
    )
    result = JSON.parse(response)

    return result['html']
  end

  def normalize_msg_type(message_type)
    if %w[notice success].include?(message_type)
      return 'success'
    elsif message_type == 'danger'
      return 'danger'
    else
      return 'info'
    end
  end
end
