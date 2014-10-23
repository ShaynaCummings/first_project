class Tag < ActiveRecord::Base
  validates :tag_name, presence: true

  belongs_to :picture
  belongs_to :user
end

