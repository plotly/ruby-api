$:.push File.expand_path('../lib', __FILE__)

require 'plotly'

Gem::Specification.new do |s|
  
  s.name        = 'plotly'
  s.version     = PlotLy::VERSION
  s.authors     = ['Louis Mullie']
  s.email       = ['louis.mullie@gmail.com']
  s.homepage    = 'https://github.com/louismullie/plotly'
  s.summary     = %q{ A Ruby wrapper to the PlotLy REST API. }
  s.description = %q{ PlotLy is a a Ruby wrapper to the PlotLy REST API. }
  
  s.files = Dir['lib/**/*'] + ['README.md', 'LICENSE']
    
  s.add_runtime_dependency 'json'
  
end