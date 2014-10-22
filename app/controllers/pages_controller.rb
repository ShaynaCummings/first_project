class PagesController < ApplicationController

  # method to get pics from reddit to pass into roulette view  - make this into a module bc no need to save to db!
  def roulette
    @reddit_results = HTTParty.get("http://www.reddit.com/r/awwgifs/hot/.json?limit=50")
    @links_list = @reddit_results["data"]["children"].map { |id| id["data"]["url"] }
    @links_list.reject! {|x| x[-3, 3]!="gif"}
    @links_list
  end

  def subreddit_roulette(subreddit)
    @reddit_results = HTTParty.get("http://www.reddit.com/r/#{subreddit}/hot/.json?limit=50")
    @links_list = @reddit_results["data"]["children"].map { |id| id["data"]["url"] }
    @links_list.reject! {|x| x[-3, 3]!="gif"}
    @links_list
  end

end

