source 'https://rubygems.org'

gem 'sinatra'
gem 'activerecord', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
gem 'thin'
gem 'shotgun'
gem 'pry'
gem 'bcrypt'
gem 'tux'
gem 'sinatra-flash'
gem 'mysql2', '>= 0.3.18', '< 0.6.0'

source :rubygems


group :development, :test do
  gem 'sqlite3'
  gem "rspec"
  gem 'rack-test'

end

group :production do
  gem 'pg', '0.18.4'
end
