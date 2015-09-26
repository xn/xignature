# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "xignature/version"

Gem::Specification.new do |s|
  s.name        = "xignature"
  s.version     = Xignature::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Martyn Loughran", "XN"]
  s.email       = ["me@mloughran.com", "christian.trosclair@gmail.com"]
  s.homepage    = "http://github.com/xn/xignature"
  s.summary     = %q{Simple key/secret based authentication for apis without domain collisions.}
  s.description = %q{Simple key/secret based authentication for apis without domain collisions.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "jruby-openssl" if defined?(JRUBY_VERSION)
  s.add_development_dependency "rspec"
  s.add_development_dependency "em-spec"
end
