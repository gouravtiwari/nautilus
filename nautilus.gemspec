# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "nautilus/version"

Gem::Specification.new do |s|
  s.add_development_dependency "rspec"
  s.name        = "nautilus"
  s.version     = Nautilus::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Thomas Newton"]
  s.email       = ["tnewton@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Create a shell project to get started rapidly}
  s.description = %q{Get developing quickly}

  s.rubyforge_project = "nautilus"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
