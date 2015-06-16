Gem::Specification.new do |spec|
  spec.name          = "lita-wolframalpha"
  spec.version       = "1.0.0"
  spec.authors       = ["Simon Lundström"]
  spec.email         = ["simmel@soy.se"]
  spec.description   = "Query WolframAlpha®s computational knowledge engine™"
  spec.summary       = "Query WolframAlpha®s computational knowledge engine™"
  spec.homepage      = "https://github.com/simmel/lita-wolframalpha"
  spec.license       = "ISC license"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4.3"
  spec.add_runtime_dependency "nokogiri", "~> 1.5"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rspec", ">= 3.0.0"
end
