# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sticky_colour/version'
require "sticky_colour/sticky_sheet"
require "sticky_colour/sticky_note"
require "sticky_colour/sticky_output"

Gem::Specification.new do |spec|
  spec.name          = "sticky_colour"
  spec.version       = StickyColour::VERSION
  spec.authors       = ["Sascha Burku"]
  spec.email         = ["sascha_burku@yahoo.de"]

  spec.summary       = %q{Is a gem solution for the pile of paper problem.}
  spec.description   = %q{For a detailed description of the pile of paper problem see https://github.com/fsufitch/dailyprogrammer/blob/master/ideas/pile_of_paper/suggest_paper.md}
  spec.homepage      = "https://github.com/sushie1984/sticky_colour"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
end
