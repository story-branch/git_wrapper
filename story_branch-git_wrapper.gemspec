require_relative "lib/story_branch/git/version"

Gem::Specification.new do |spec|
  spec.name = "story_branch-git_wrapper"
  spec.version = StoryBranch::Git::VERSION
  spec.authors = ["Rui Baltazar"]
  spec.email = ["rui.p.baltazar@gmail.com"]

  spec.summary = "Git::Wrapper to help running git commands with direct system calls"
  spec.description = <<~DESCRIPTION
    Git::Wrapper provides a series of commands that wrap actual git commands and processes the output
  DESCRIPTION
  spec.homepage = "https://github.com/story-branch/git_wrapper"
  spec.license = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata = {
    "bug_tracker_uri" => "https://github.com/story-branch/git_wrapper/issues",
    "changelog_uri" => "https://github.com/story-branch/git_wrapper/blob/master/Changelog.md",
    "documentation_uri" => "https://github.com/story-branch/git_wrapper/blob/master/README.md",
    "source_code_uri" => "https://github.com/story-branch/git_wrapper",
    "homepage_uri" => spec.homepage
  }

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path("..", __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "minitest", "~> 5.16"
  spec.add_development_dependency "minitest-reporters", "~> 1.5"
  spec.add_development_dependency "standard", "~> 1.15"
end
