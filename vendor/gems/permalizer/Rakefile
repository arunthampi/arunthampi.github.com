require 'rubygems'
require 'rake/gempackagetask'

NAME    = "permalizer"
VERSION = "0.6"

spec = Gem::Specification.new do |s|
  s.name              = NAME
  s.version           = VERSION
  s.description       = "Creates clean URLs for whatever string you send to it."
  s.authors           = ["Robert R Evans", "Marcos Arias"]
  s.email             = "revans@robertrevans.com"
  s.homepage          = "http://github.com/revans/permalizer"
  s.summary           = "Creates clean URLs for whatever string you send to it."
  s.has_rdoc          = true
  s.extra_rdoc_files  = ["readme.markdown", "LICENSE"]
  s.files = %w(LICENSE readme.markdown Rakefile) + Dir.glob("{lib,spec}/**/*")
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

task :install => [:package] do
  sh %{sudo gem install pkg/#{NAME}-#{VERSION}}
end