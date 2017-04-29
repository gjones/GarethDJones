###
# Compass
###

require 'secrets'
require 'susy'
require 'rack/rewrite'
require 'rack/no-www'

use Rack::NoWWW

Secrets::Config.configure do |config|
  config.secrets_file = 'secrets.yml' # 'secrets.yml' by default
end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :fonts_dir,  "fonts-folder"
activate :livereload
set :images_dir, 'images'
set :cloud, 'http://d1ieljxa6xmxy5.cloudfront.net'

# Build-specific configuration
configure :build do
  # Nothing as yet
end

###
# Blog settings
###

# Time.zone = "UTC"

activate :blog do |blog|
  blog.prefix = "thoughts"
  blog.permalink = ":title"
  blog.sources = ":title.html"
  blog.layout = "layouts/blog"
  blog.taglink = "/tags/:tag.html"
  # blog.year_link = ":year.html"
  # blog.month_link = ":year/:month.html"
  # blog.day_link = ":year/:month/:day.html"
  # blog.default_extension = ".markdown"

  blog.tag_template = "/tags/tag.html"
  # blog.calendar_template = "calendar.html"

  # blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/:num"
end

page "/thoughts/feed.xml", :layout => false


activate :sync do |sync|
  Fog.credentials = { path_style: true }
  sync.fog_provider = 'AWS'
  sync.fog_directory = Secrets.production.fog_directory
  sync.fog_region = 'us-east-1'
  sync.aws_access_key_id = Secrets.production.aws_access_key_id
  sync.aws_secret_access_key = Secrets.production.aws_secret_access_key
  sync.existing_remote_files = 'delete'
end

activate :directory_indexes
