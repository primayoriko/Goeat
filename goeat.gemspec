lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "goeat/version"

Gem::Specification.new do |spec|
  spec.name          = "goeat"
  spec.version       = Goeat::VERSION
  spec.authors       = ["Naufal Prima Yoriko"]
  spec.email         = ["primayoriko@gmail.com"]

  spec.summary       = %q{An application that can make a map, and simulate how to order a food by it}
  #spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "https://www.github.com/primayoriko/Goeat.git"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = "https://www.github.com/primayoriko/Goeat.git"
  spec.metadata["source_code_uri"] = "https://www.github.com/primayoriko/Goeat.git"
  spec.metadata["changelog_uri"] = "https://www.github.com/primayoriko/Goeat.git"

  # Specify which files should be added to the gem when it is released.
  spec.files         = `git ls-files`.split("\n")
  spec.bindir        = "exe"
  spec.executables   = ["GoEat"]        #spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'thor'
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 12.3"
  spec.add_development_dependency "rspec", "~> 3.8"
end
