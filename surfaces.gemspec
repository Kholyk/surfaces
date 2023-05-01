# frozen_string_literal: true

require_relative "lib/surfaces/version"

Gem::Specification.new do |spec|
  spec.name = "surfaces"
  spec.version = Surfaces::VERSION
  spec.authors = ["Oleg Kholyk"]
  spec.email = ["oleg@kholyk.ru"]

  spec.summary = "Calculates area of surfaces for basic geometrical primitives"
  spec.description = "Calculates area of surfaces for basic geometrical primitives"
  spec.homepage = "https://github.com/Kholyk/surfaces"
  spec.required_ruby_version = ">= 3.2.1"

  spec.metadata["allowed_push_host"] = "https://github.com/Kholyk/surfaces"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
