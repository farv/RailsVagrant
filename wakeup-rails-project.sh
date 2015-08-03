#!/usr/bin/env bash
cd /usr/share/nginx/html/
rails new $1
cd $1
sed -i "s/# gem 'therubyracer', platforms: :ruby/gem 'therubyracer', platforms: :ruby\ngem 'execjs'/" Gemfile
bundle install
# bin/rails s -b 0.0.0.0