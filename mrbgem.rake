MRuby::Gem::Specification.new('mruby-test-stub') do |spec|
  spec.license = 'MIT'
  spec.authors = 'buty4649@gmail.com'
  spec.summary = 'Adds MiniTest-like stub methods to mruby-test for efficient testing by isolating dependencies in the mruby environment'
  spec.description = 'Adds MiniTest-like stub methods to mruby-test for efficient testing by isolating dependencies in the mruby environment'
  spec.version = '1.0.0'

  spec.add_test_dependency 'mruby-test'
end
