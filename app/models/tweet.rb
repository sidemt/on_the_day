class Tweet
  def initialize(day)
    @day = day
  end

  # Configures consumer key/secret pair and OAuth access token/secret pair
  def authenticate
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['CONSUMER_KEY']
      config.consumer_secret     = ENV['CONSUMER_SECRET']
      config.access_token        = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    end
    return client
  end

  # Returns tweet IDs of the search results
  def search_tweets
    results = []
    client = authenticate

    # Search tweets using 'twitter' gem
    client.search('100DaysOfCode -rt Day' + @day.to_s, result_type: 'recent')
          .take(3).each do |tweet|
      results.push(tweet.id)
    end

    return results
  end
end
