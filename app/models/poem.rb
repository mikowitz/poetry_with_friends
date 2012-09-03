class Poem < ActiveRecord::Base
  belongs_to :prompt
  belongs_to :user
  attr_accessible :content

  validates_presence_of :content, :user_id, :prompt_id

  scope :for, lambda {|prompt| where('prompt_id = ?', prompt.id).order('created_at DESC') }

  def first_line
    return content if content.scan(/\n/).empty?
    content.scan(/.*\n/).first.strip
  end
end
