Gem::Specification.new do |s|
  s.name = 'rack-active_record_status'
  s.version = '0.7.0'

  s.summary = "Rack middelware to check ActiveRecord's connection"
  s.description = "A server health check for active_record."

  s.authors  = ["Aaron Suggs"]
  s.email    = 'aaron@ktheory.com'
  s.homepage = 'https://github.com/ktheory/rack-active_record_status'

  s.rdoc_options = ["--charset=UTF-8"]
  s.extra_rdoc_files = %w[README.rdoc]

  s.add_dependency 'rack'
  s.add_dependency 'activerecord'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'shoulda'
  s.add_development_dependency 'rack-test'

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {spec,tests}/*`.split("\n")
end
