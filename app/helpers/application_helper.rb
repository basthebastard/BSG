module ApplicationHelper
end


def dat_markdown(text) #keeps formatting
  options = {
    :autolink => true,
    :space_after_headers => true,
    :no_intra_emphasis => true
  }
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
  markdown.render(text).html_safe
end

def sentence_truncate(s, options = {}) #display x amount of sentences
	options.reverse_merge!({:words => 0})
    if options[:sentences]
      return s.split(/\.(\s|$)+/)[0, options[:sentences]].map{|s| s.strip}.join('. ') + '.'
    end
  a = s.split(/\s/) # or /[ ]+/ to only split on spaces
  n = options[:words]
  a[0...n].join(' ') + (a.size > n ? '...' : '')
end