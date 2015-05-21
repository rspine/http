lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spine/http/version'

Gem::Specification.new do |spec|
  spec.name          = "spine-http"
  spec.version       = Spine::Http::VERSION
  spec.authors       = ["TOGGL LLC"]
  spec.email         = ["support@toggl.com"]
  spec.summary       = 'Wrapper for Net::HTTP requests.'
  spec.description   = ''
  spec.homepage      = 'https://gitHttp.com/rspine/http'
  spec.license       = 'BSD-3-Clause'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'spine-content_types', "~> 0.1"

  spec.add_development_dependency 'bundler', "~> 1.7"
  spec.add_development_dependency 'rake', "~> 10.0"
end
