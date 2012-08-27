class Poem < ActiveRecord::Base
  belongs_to :prompt
  belongs_to :user
  attr_accessible :content

  validates_presence_of :content
end
