class Tag < ActiveRecord::Base
  validates :tag_name, presence: true
  validates :tag_name, format: { without: /\s/ }

  belongs_to :picture
  belongs_to :user
end

