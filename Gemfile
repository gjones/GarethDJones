# If you have OpenSSL installed, we recommend updating
# the following line to use "https"
source 'http://rubygems.org'

gem "middleman"

# Live-reloading plugin
gem "middleman-livereload", "~> 3.1.0"

# Sync assets to AWS3
gem "middleman-sync", "~> 3.0.12"

# Blogging
gem 'middleman-blog', github: 'middleman/middleman-blog'

# For faster file watcher updates on Windows:
gem "wdm", "~> 0.1.0", :platforms => [:mswin, :mingw]

# My Tools
gem 'compass'
gem 'sass'
gem 'susy'
gem 'haml'
gem "turbolinks", require: false
gem 'font-awesome-middleman'
gem 'nokogiri'
gem 'rack-rewrite'
gem 'rack-no-www'
gem 'rack-cors'
gem 'unf'
gem 'builder'

# Secrets
gem 'secrets', github: 'jastkand/secrets'

# Cross-templating language block fix for Ruby 1.8
platforms :mri_18 do
  gem "ruby18_source_location"
end
