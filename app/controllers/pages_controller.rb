class PagesController < ApplicationController

  # method to get pics from reddit to pass into roulette view  - make this into a module bc no need to save to db!
  def roulette
    @reddit_results = HTTParty.get("http://www.reddit.com/r/aww/hot/.json?limit=50")
    @links_list = @reddit_results["data"]["children"].map { |id| id["data"]["url"] }
    @links_list.reject! {|x| x[-3, 3]!="jpg"}
    @links_list
  end

end

