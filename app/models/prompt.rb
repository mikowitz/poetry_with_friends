class Prompt < ActiveRecord::Base
  attr_accessible :content

  belongs_to :user
  has_many :poems

  validates_presence_of :content, :user_id

  scope :newest_first, lambda { order('created_at DESC') }

  scope :that_match, lambda {|query|
    return unless query.present?
    where(Prompt.arel_table[:content].matches("%#{query}%"))
  }
end
