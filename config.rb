###
# Compass
###

require 'susy'

require 'rack/rewrite'
require 'rack/no-www'

use Rack::NoWWW

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :fonts_dir,  "fonts-folder"
activate :livereload
set :images_dir, 'images'
set :cloud, 'http://d1ieljxa6xmxy5.cloudfront.net'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
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
  sync.fog_provider = 'AWS' # Your storage provider
  sync.fog_directory = 'garethdjones.com' # Your bucket name
  sync.fog_region = 'us-east-1' # The region your storage bucket is in (eg us-east-1, us-west-1, eu-west-1, ap-southeast-1 )
  sync.aws_access_key_id = 'AKIAIJ7PY4LNWZCOAIMQ' # Your Amazon S3 access key
  sync.aws_secret_access_key = 'gsiStdzYVhyhL+aAzKGEPp0wkMfOG6uYq1KjmCRD' # Your Amazon S3 access secret
  sync.existing_remote_files = 'delete' # What to do with your existing remote files? ( keep or delete )
  # sync.gzip_compression = false # Automatically replace files with their equivalent gzip compressed version
  # sync.after_build = false # Disable sync to run after Middleman build ( defaults to true )
end

activate :directory_indexes
