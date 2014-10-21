class PagesController < ApplicationController
  def show
    client = Soundcloud.new(client_id: ENV['SOUNDCLOUD_CLIENT_ID'],
                        client_secret: ENV['SOUNDCLOUD_SECRET'])
    @tracks = client.get('/tracks', :limit => 5, :order => 'hotness')
  end


end


# httparty call to get cute pics:

#aww_data = HTTParty.get("http://www.reddit.com/r/aww/top/.json")
#aww_data["data"]["children"].map { |id| id["data"]["url"] }
