require_relative 'lib/jpfs/version'

Gem::Specification.new do |spec|
  spec.name          = "jpfs"
  spec.version       = Jpfs::VERSION
  spec.authors       = ["mizokami"]
  spec.email         = ["r.mizokami@gmail.com"]

  spec.summary       = %q{Japan Prefecture Fuzzy Searcher}
  spec.description   = %q{Japan Prefecture Fuzzy Searcher}
  spec.homepage      = "https://github.com/mizoR/jpfs"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/mizoR/jpfs"
  spec.metadata["changelog_uri"] = "https://github.com/mizoR/jpfs/CHANGELOG"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "geokit"
end
