source("https://rubygems.org")

gem("sinatra")
gem("sinatra-contrib", :require => "sinatra/reloader")
gem("sinatra-activerecord")
gem("rake")
gem("pg")

group(:test) do
  gem("rspec")
  gem("pry")
  gem("shoulda-matchers")
end

group(:production) do
  gem("capybara")
end
