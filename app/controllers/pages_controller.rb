class PagesController < ApplicationController

  def pick_subreddit
    @subreddit = Subreddit.new
  end

  def reload
  end

  # method to get pics from reddit to pass to roullette view
  def roulette
    @reddit_results = HTTParty.get("http://www.reddit.com/r/aww/hot/.json?limit=50")
    @links_list = @reddit_results["data"]["children"].map { |id| id["data"]["url"] }
    @links_list.reject {|x| x[-3, 3]!="jpg"}
    @links_list
  end

end




#roulette notes


# previous validation from reddit (led to too much listing)

#     <% aww_data = HTTParty.get("http://www.reddit.com/r/aww/hot/.json?limit=50") %>
#     <% links_list = aww_data["data"]["children"].map { |id| id["data"]["url"] } %>
#     <% links_list.map do |link| %>
#       <% if link[-1,1] == "g" %>
#       <li> <img src="<%= links_list.sample %>" width=400px></li>
#       <% end %>
#     <% end %>
