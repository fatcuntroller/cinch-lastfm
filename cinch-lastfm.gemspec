# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "cinch-lastfm"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Anton Sebvie"]
  s.date = "2013-05-29"
  s.description = "This is the Cinch Last.fm plugin adding 'recently played' functionality."
  s.email = "fatkuntroller@gmail.com"
  s.extra_rdoc_files = ["README.md"]
  s.files = ["Gemfile", "LICENSE", "README.md", "spec/lastfm_spec.rb", "spec/spec_helper.rb", "lib/cinch/plugins/lastfm.rb"]
  s.homepage = "https://github.com/fatcuntroller/cinch-lastfm"
  s.rdoc_options = ["--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Cinch Lastfm plugin"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, [">= 0"])
      s.add_runtime_dependency(%q<cinch>, [">= 2.0.0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<nokogiri>, [">= 0"])
      s.add_dependency(%q<cinch>, [">= 2.0.0"])
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<nokogiri>, [">= 0"])
    s.add_dependency(%q<cinch>, [">= 2.0.0"])
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end
