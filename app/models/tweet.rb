class Tweet
  
  # Configures consumer key/secret pair and OAuth access token/secret pair
  def authenticate
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['CONSUMER_KEY']
      config.consumer_secret     = ENV['CONSUMER_SECRET']
      config.access_token        = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    end
    client
  end

  # Returns tweet IDs of the search results
  def search_tweets
    results = []
    client = authenticate

    client.search('100DaysOfCode Day1', result_type: 'recent')
          .take(5).each do |tweet|
      results.push(tweet.id)
    end

    results
  end
end
