Dir[File.dirname(__FILE__) + '/extra/easy_patch/**/*.rb'].each { |file| require_dependency file }

# this block is executed once just after Redmine is started
# means after all plugins are initialized
# it is place for plain requires, not require_dependency
# it should contain hooks, permissions - base class in Redmine is required thus is not reloaded
ActiveSupport.on_load(:easyproject, yield: true) do

  require 'modification_easy_custom_field_months/internals'
  require 'modification_easy_custom_field_months/hooks'

end

# this block is called every time rails are reloading code
# in development it means after each change in observed file
# in production it means once just after server has started
# in this block should be used require_dependency, but only if necessary.
# better is to place a class in file named by rails naming convency and let it be loaded automatically
# Here goes query registering, custom fields registering and so on
RedmineExtensions::Reloader.to_prepare do

  Dir[File.dirname(__FILE__) + '/lib/easy_extensions/field_formats/**/*.rb'].each { |file| require_dependency file }

end
