class Prompt < ActiveRecord::Base
  attr_accessible :content, :user_id

  belongs_to :user
  has_many :poems
  validates_presence_of :content
end
