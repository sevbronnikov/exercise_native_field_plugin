module ModificationEasyCustomFieldMonths
  module CustomFieldPatch

    def self.included(base)
      base.extend(ClassMethods)
      base.include(InstanceMethods)
      base.include(Redmine::SafeAttributes)

      base.class_eval do

          alias_method_chain :possible_values, :modification_easy_custom_field_months

      end
    end

    module InstanceMethods

      def possible_values_with_modification_easy_custom_field_months
        if self.field_format == 'month_select'
          I18n.t('date.month_names').reject(&:blank?)
        else
          possible_values_without_modification_easy_custom_field_months end
      end

    end

    module ClassMethods

    end
  end
end
EasyExtensions::PatchManager.register_model_patch 'CustomField', 'ModificationEasyCustomFieldMonths::CustomFieldPatch'
