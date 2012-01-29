# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "setup_recipes"
  s.version     = "0.0.1"
  s.authors     = ["Stas Ladonenko"]
  s.email       = ["stas.ladonenko@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Capistrano task for initial project/server setup}
  s.description = %q{A bunch of useful recipes to speed up initial server setup}

  s.rubyforge_project = "setup_recipes"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency(%q<capistrano>, [">= 2.9"])
end
