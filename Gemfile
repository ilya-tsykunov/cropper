source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'bootstrap-generators', '~> 3.3.4'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17.47'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'haml-rails', '~> 0.9'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'momentjs-rails', '>= 2.9.0'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.2'
gem 'sass-rails', '~> 5.0'
gem 'sidekiq'
gem 'simple_form'
gem 'turbolinks', '~> 5'
gem 'tzinfo-data', platforms: %i(mingw mswin x64_mingw jruby)
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'

group :development, :test do
  gem 'byebug', platforms: %i(mri mingw x64_mingw)
  gem 'capybara', '~> 2.13'
  gem 'factory_girl_rails'
  gem 'rspec-rails', '~> 3.5'
end

group :development do
  gem 'database_cleaner'
  gem 'letter_opener'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'poltergeist'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end
