class Picture < ActiveRecord::Base

  validates :url, presence: true
  validates :user_id, presence: true

  has_many :tags
  belongs_to :user
  delegate :name, to: :user, prefix: true

  # need to clean this up to deal with https images
  def gfy_convert(url)
    httpless = url.gsub(/http:\/\//, '')
    # @picture.url.gsub(/https:\/\//, '')
    # @picture.url.chomp('https')
    upload_url = "http://upload.gfycat.com/transcode?fetchUrl=#{httpless}"
    gfycat_results = HTTParty.get(upload_url)
    gfy_slug = gfycat_results["gfyName"]
    gfy_url = "http://www.gfycat.com/#{gfy_slug}"
  end

  def save_gfy(picture)
    picture.gfy_url = picture.gfy_convert(picture.url)
  end

end
