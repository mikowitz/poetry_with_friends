class Poem < ActiveRecord::Base
  belongs_to :prompt
  belongs_to :user
  attr_accessible :content

  validates_presence_of :content

  scope :for, lambda {|prompt| where('prompt_id = ?', prompt.id).order('created_at DESC') }
end
