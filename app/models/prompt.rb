class Prompt < ActiveRecord::Base
  attr_accessible :content, :user_id

  belongs_to :user
  validates_presence_of :content
end
