module ModificationEasyCustomFieldMonths
  module CustomFieldsHelperPatch

    def self.included(base)


      base.class_eval do
        #alias_method_chain :available_easy_lookup_entity_custom_field_formats, :modification_easy_custom_field_months

        def available_easy_lookup_entity_custom_field_formats
          [
            'amount', 'autoincrement', 'bool', 'date', 'datetime', 'float', 'int', 'string', 'text',
            'country_select', 'easy_percent', 'easy_rating', 'email', 'link', 'list',
            'easy_google_map_address', 'value_tree', 'month_select'
          ]
        end

      end
    end
  end
end
EasyExtensions::PatchManager.register_helper_patch 'CustomFieldsHelper', 'ModificationEasyCustomFieldMonths::CustomFieldsHelperPatch'