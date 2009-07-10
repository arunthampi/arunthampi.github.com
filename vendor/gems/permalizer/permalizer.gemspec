Gem::Specification.new do |s|
  s.name              = "permalizer"
  s.version           = "0.6"
  s.description       = "Creates clean URLs for whatever string you send to it."
  s.authors           = ["Robert R Evans", "Marcos Arias"]
  s.email             = "revans@robertrevans.com"
  s.homepage          = "http://github.com/revans/permalizer"
  
  s.has_rdoc          = true
  s.extra_rdoc_files  = ["readme.markdown", "LICENSE"]
  s.files = %w(LICENSE readme.markdown Rakefile) + Dir.glob("{lib,spec}/**/*")
end