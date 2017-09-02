Gem::Specification.new do |s|
   s.name          = 'kele'
   s.version       = '0.0.1'
   s.date          = '2017-09-02'
   s.summary       = 'Kele API Client'
   s.description   = 'A client for the Bloc API'
   s.authors       = ['Constance Gobert']
   s.email         = 'constancegobert@hotmail.fr'
   s.files         = ['lib/kele.rb']
   s.require_paths = ["lib"]
   s.homepage      =
     'http://rubygems.org/gems/kele'
   s.license       = 'MIT'
   s.add_dependency 'httparty', '~> 0.13' #instructs  bundle to install httparty (provides a programmatic Ruby interface to make HTTP requests).
 end
