Gem::Specification.new do |s|
  s.name = 'rack-active_record_status'
  s.version = '0.1'

  s.summary = "Rack middelware to check ActiveRecord's connection"
  s.description = "A server health check for active_record."

  s.authors  = ["Aaron Suggs"]
  s.email    = 'aaron@ktheory.com'
  s.homepage = 'http://github.com/ktheory/active_record_rack_status'
  s.required_rubygems_version = ">= 1.3.5"

  ## This sections is only necessary if you have C extensions.
  # s.require_paths << 'ext'
  # s.extensions = %w[ext/extconf.rb]

  ## If your gem includes any executables, list them here.
  s.executables = []

  ## Specify any RDoc options here. You'll want to add your README and
  ## LICENSE files to the extra_rdoc_files list.
  s.rdoc_options = ["--charset=UTF-8"]
  s.extra_rdoc_files = %w[README.rdoc]

  ## List your runtime dependencies here. Runtime dependencies are those
  ## that are needed for an end user to actually USE your code.
  s.add_dependency 'rack'
  s.add_dependency 'activerecord'

  ## List your development dependencies here. Development dependencies are
  ## those that are only needed during development
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'shoulda'
  s.add_development_dependency 'rack-test'

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {spec,tests}/*`.split("\n")
end
