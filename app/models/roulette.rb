class Roulette

# this needs to be a module probably
  def aww_roulette
    @reddit_results = HTTParty.get("http://www.reddit.com/r/gifs/hot/.json?limit=50")
    @links_list = @reddit_results["data"]["children"].map { |id| id["data"]["url"] }
    @links_list.reject! {|x| x[-3, 3]!="jpg"}
    @links_list.sample
  end

end
