Middleman::Templates.register :slim

activate :blog do |blog|
  blog.prefix = 'blog'
  blog.permalink = "{title}.html"
  blog.new_article_template = 'templates/blog_post.erb'
end

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.method = :git
end

activate :directory_indexes
activate :livereload
activate :syntax

set :markdown_engine, :kramdown

set :css_dir, 'stylesheets'
set :js_dir, 'scripts'
set :images_dir, 'images'

configure :build do
  activate :minify_css
  activate :asset_hash
  activate :minify_javascript
  activate :relative_assets
end

ignore   '/blog/drafts/*'
