require 'iconv'

String.class_eval do
  def permalize(from = 'utf-8', to = 'ascii//translit')
    s = self.gsub(/'/, '').to_ascii_iconv
    s.gsub!(/\W+|_/, ' ') # all non-word chars to spaces
    s.strip!
    s.downcase!
    s.gsub!(/\ +/, '-') # spaces to dashes
    s
  end

  def to_ascii_iconv
    begin
      s = self.dup
      return Iconv.iconv('ascii//translit//ignore', 'utf-8', s).to_s
    rescue Iconv::IllegalSequence
      return ''
    rescue Iconv::InvalidCharacter
      return ''
    end
  end
end

namespace :mclovin do
  desc "New Blog Post, Usage: rake mclovin:new blog_title=\"Test\""
  task :new do
    blog_title, now = ENV['blog_title'], Time.now
    todays_date = now.strftime("%Y-%m-%d")

    slug = "#{todays_date}-#{blog_title.permalize}"
    File.open("_posts/#{slug}.textile", 'w') do |out|
      out.puts("---")
      out.puts("layout: post")
      out.puts("title: #{blog_title}")
      out.puts("---")
      out.puts

      out.puts("<h1><a href=\"{{ page.url }}\">{{ page.title }}</a></h1>")
      out.puts
      out.puts("p(meta). #{now.day} #{now.strftime("%h")} #{now.year} - Singapore")
    end

    puts "** New Blog Post '#{blog_title}' Created at: _posts/#{slug}.textile"
  end
end