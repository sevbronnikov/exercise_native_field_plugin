module ModificationEasyCustomFieldMonths
  module EntityAttributeHelperPatch

    def self.included(base)
      base.extend(ClassMethods)
      base.include(InstanceMethods)

      base.class_eval do
        alias_method_chain :format_html_issue_attribute, :modification_easy_custom_field_months
      end
    end

    module InstanceMethods
      def format_html_issue_attribute_with_modification_easy_custom_field_months(entity_class, attribute, unformatted_value, options = {})
        options[:inline_editable] = true if options[:inline_editable].nil?
        value                     = format_entity_attribute(entity_class, attribute, unformatted_value, options)

        case attribute.name
        when :partner_id
          entity_multieditable_tag(entity_class, 'partner_id', h(value), options, { :value => unformatted_value.to_s, :type => 'text' })
        when :kpi_ratio
          entity_multieditable_tag(entity_class, 'kpi_ratio', h(value), options, { :value => unformatted_value.to_s, :type => 'numeric' })
        when :is_efficient
          entity_multieditable_tag(entity_class, 'is_efficient', h(value), options, { :value => unformatted_value.to_s, :type => 'select', :source => boolean_source })
        when :base_month
          entity_multieditable_tag(entity_class, 'base_month', h(value), options, { :value => unformatted_value.to_s, :type => 'select' })
        when :managers_notes
          entity_multieditable_tag(entity_class, 'managers_notes', h(value), options, { :value => unformatted_value.to_s, :type => 'textarea' })
        else
          format_html_issue_attribute_without_modification_easy_custom_field_months(entity_class, attribute, unformatted_value, options)
        end
      end
    end

    module ClassMethods

    end
  end
end
EasyExtensions::PatchManager.register_model_patch 'EntityAttributeHelper', 'ModificationEasyCustomFieldMonths::EntityAttributeHelperPatch'
