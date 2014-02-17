require 'redmine'

Rails.configuration.to_prepare do
  require_dependency 'syntax_highlighting'
  require_dependency 'view_hook'
end

Redmine::Plugin.register :redmine_rouge do
  name 'Redmine Rouge plugin'
  author 'Toshiyuki Goto'
  description 'Rouge syntax highlighter for Redmine.'
  version '0.0.1'
  url 'https://github.com/ngyuki/redmine_rouge'
  author_url 'https://github.com/ngyuki'
end
