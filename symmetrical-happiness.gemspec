# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'symmetrical_happiness/version'

Gem::Specification.new do |spec|
  spec.name          = "symmetrical-happiness"
  spec.version       = SymmetricalHappiness::VERSION
  spec.authors       = ["Alexey Nikitin"]
  spec.email         = ["nikitin@bookmate.com"]

  spec.summary       = 'Not ready yet'
  spec.description   = "I don't know"
  spec.homepage      = 'https://github.com/tank-bohr/symmetrical-happiness'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'gosu', '0.10.9.pre1'
  spec.add_dependency 'texplay', '0.4.4.pre'

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
