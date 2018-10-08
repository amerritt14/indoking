# frozen_string_literal: true
source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "bcrypt"
gem "bootstrap"
gem "haml-rails"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "mysql2"
gem "pry-rails"
gem "puma", "~> 3.0"
gem "pundit"
gem "rails", "~> 5.0.7"
gem "sass-rails", "~> 5.0"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"

group :development, :test do
  gem "byebug", platform: :mri
  gem "capistrano", "~> 3.7", ">= 3.7.1"
  gem "capistrano-passenger", "~> 0.2.0"
  gem "capistrano-rails", "~> 1.2"
  gem "capistrano-rbenv", "~> 2.1"
end

group :development do
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i(mingw mswin x64_mingw jruby)
