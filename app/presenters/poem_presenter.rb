class PoemPresenter
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::SanitizeHelper

  attr_accessor :output_buffer

  def self.for(poem)
    new(poem)
  end

  def initialize(poem)
    @poem = poem.instance_of?(Poem) ? poem : Poem.where(:id => poem).first
  end

  def prompt
    @poem.prompt
  end

  def author
    @poem.user
  end

  def poem
    content_tag(:div, class: 'poem') do
      strip_tags(@poem.content).split("\n\n").map {|stanza| format_stanza(stanza) }.join("\n\n").html_safe
    end
  end

  private

  def format_stanza(stanza)
    content_tag(:ol, class: 'stanza') do
      stanza.split("\n").map {|line| format_line(line) }.join("\n").html_safe
    end
  end

  def format_line(line)
    classes = []
    classes << 'indent' if line =~ /^\s/
    content_tag(:li, line.strip, class: (classes.any? ? classes : nil))
  end
end
