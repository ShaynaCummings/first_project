class AddGifyurlToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :gfy_url, :string
  end
end
