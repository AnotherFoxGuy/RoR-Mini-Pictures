# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

base_dir = File.dirname(__FILE__) + "/source/pictures/"
file_list = Dir[base_dir + "*.*"].map {|f| f.sub!(base_dir,"")}.each_slice(100).to_a
file_list.sort

proxy "index.html", "/index_template.html", :locals => { :file_list => file_list }, :ignore => true

file_list.each_with_index do |list, i|
  proxy "/page_#{i}.html", "/page.html", :locals => { :file_list => list, :index => i, :max => file_list.length }, :ignore => true
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript
# end
