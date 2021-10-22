Redmine::Plugin.register :modification_easy_custom_field_months do
  name :modification_easy_custom_field_months_name
  author :modification_easy_custom_field_months_author
  author_url :modification_easy_custom_field_months_author_url
  description :modification_easy_custom_field_months_description
  version '2021'

  #into easy_settings goes available setting as a symbol key, default value as a value
  settings easy_settings: {  }
  
end


unless Redmine::Plugin.registered_plugins[:easy_extensions]
  require_relative 'after_init'
end


