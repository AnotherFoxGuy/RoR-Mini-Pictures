# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

config[:cdn_url] = "https://cdn.anotherfoxguy.com/repo-backup"

data.mini_pictures.each_slice(100).each_with_index do |list, i|
  proxy "/page_#{i}.html", "/page.html", locals: { mini_pictures: list, index: i, max: 29 }, ignore: true
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page "/*.xml", layout: false
page "/*.json", layout: false
page "/*.txt", layout: false

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

configure :build do
  #   activate :minify_css
  #   activate :minify_javascript
  activate :minify_html
end
