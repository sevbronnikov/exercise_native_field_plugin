module ModificationEasyPatch
  module CustomFieldsHelperPatch

    def self.included(base)
      #      base.include(InstanceMethods)

      base.class_eval do

        def available_easy_lookup_entity_custom_field_formats
          [
            'amount', 'autoincrement', 'bool', 'date', 'datetime', 'float', 'int', 'string', 'text',
            'country_select', 'easy_percent', 'easy_rating', 'email', 'link', 'list',
            'easy_google_map_address', 'value_tree', 'month_select'
          ]
        end

        #      module InstanceMethods

        #      end

      end
    end
  end
end
EasyExtensions::PatchManager.register_helper_patch 'CustomFieldsHelper', 'ModificationEasyPatch::CustomFieldsHelperPatch'