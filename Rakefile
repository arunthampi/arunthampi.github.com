require 'vendor/gems/permalizer/lib/permalizer'

namespace :mclovin do
  
  desc "New Blog Post"
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