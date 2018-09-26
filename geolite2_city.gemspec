# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "geolite2_city/version"

Gem::Specification.new do |spec|
  spec.name          = "geolite2_city"
  spec.version       = GeoLite2City::VERSION
  spec.authors       = ["Henrik Nyh"]
  spec.email         = ["henrik@nyh.se"]

  spec.summary       = %q{Includes the free GeoLite2 City database file.}
  spec.homepage      = "https://github.com/barsoom/geolite2_city"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "maxminddb"
  spec.add_development_dependency "minitest"
end
