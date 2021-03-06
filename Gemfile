source 'https://rubygems.org'

gem 'rails', '~> 5.1', '>= 5.1.1'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Project related gems
gem 'pg', '~> 0.18.4'
gem 'bootstrap', '~> 4.0.0.alpha6'
gem 'hover-rails'
gem 'dotenv-rails'
gem 'pdf-forms'
gem 'font-awesome-rails'
gem 'devise', git: 'https://github.com/plataformatec/devise.git', branch: 'master'
gem 'newrelic_rpm'
gem 'clipboard-rails'
gem 'exception_notification'
gem 'slack-notifier'

source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.1.0'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'factory_girl_rails'
  gem 'rspec-rails', '~> 3.5'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1'
  gem 'database_cleaner'
  gem 'rails-controller-testing'
  gem 'capybara'
  gem 'poltergeist'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'capistrano', '3.7.1'
  gem 'capistrano-rails', '1.2.2'
  gem 'capistrano-rbenv', '2.1.0'
  gem 'capistrano3-puma', '1.2.1'
end

group :production do
  gem 'therubyracer', platforms: :ruby
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
