module ApplicationHelper
end

#to embed images or video, just include the html such as <img... /> or <iframe...> Include the right class name for img or video.
def dat_markdown(text)
  options = {
    :autolink => true,
    :space_after_headers => true,
    :no_intra_emphasis => true
  }
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
  markdown.render(text).html_safe
end

def sentence_truncate(s, options = {})
	options.reverse_merge!({:words => 0})
    if options[:sentences]
      return s.split(/\.(\s|$)+/)[0, options[:sentences]].map{|s| s.strip}.join('. ') + '.'
    end
  a = s.split(/\s/) # or /[ ]+/ to only split on spaces
  n = options[:words]
  a[0...n].join(' ') + (a.size > n ? '...' : '')
end