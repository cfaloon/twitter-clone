module TweetsHelper
  def get_tagged(tweet)
    message_arr = tweet.message.split

    message_arr.each_with_index do|word, index|
      if word[0] == '#'
        # Create a new tag
        if Tag.pluck(:phrase).include?(word)
          # Tag exists
          tag =Tag.find_by(phrase: word)
        else
          # Tag does not exist, create new tag
          tag =Tag.create(phrase: word)
        end
        # Create the TweetTag
        tweet_tag = TweetTag.create(tweet_id: tweet.id, tag_id: tag.id)
        # #techlife => <a href='tag_tweets?id=1'>#techlife</a>
        message_arr[index] = "<a href='/tag_tweets?id=#{tag.id}'>#{word}</a>"
      end
    end
    tweet.message = message_arr.join(' ')
    return tweet
  end
end
