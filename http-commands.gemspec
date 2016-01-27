Gem::Specification.new do |s|
  s.name = 'http-commands'
  s.version = '0.2.1'
  s.summary = 'Convenience abstractions for common HTTP operations, such as post and get'
  s.description = ' '

  s.authors = ['Obsidian Software, Inc']
  s.email = 'opensource@obsidianexchange.com'
  s.homepage = 'https://github.com/obsidian-btc/http-commands'
  s.licenses = ['MIT']

  s.require_paths = ['lib']
  s.files = Dir.glob('{lib}/**/*')
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.2.3'

  s.add_runtime_dependency 'connection-client'
  s.add_runtime_dependency 'controls'
  s.add_runtime_dependency 'http-protocol'

  s.add_development_dependency 'test_bench'
end
