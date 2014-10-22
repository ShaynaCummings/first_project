class PagesController < ApplicationController
  def show

  end

  def roulette
    @reddit_results = HTTParty.get("http://www.reddit.com/r/aww/hot/.json?limit=50")
    @links_list = @reddit_results["data"]["children"].map { |id| id["data"]["url"] }
    @links_list.reject {|x| x["jpg"]==nil}
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
