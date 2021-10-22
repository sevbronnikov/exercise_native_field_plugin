module ModificationEasyPatch
  module EntityAttributeHelperPatch

    def self.included(base)
      base.extend(ClassMethods)
      base.include(InstanceMethods)

      base.class_eval do
        alias_method_chain :format_html_issue_attribute, :modification_easy_patch
      end
    end

    module InstanceMethods
      def format_html_issue_attribute_with_modification_easy_patch(entity_class, attribute, unformatted_value, options = {})
        options[:inline_editable] = true if options[:inline_editable].nil?
        value                     = format_entity_attribute(entity_class, attribute, unformatted_value, options)

        case attribute.name
        when :partner_id

        when :kpi_ratio
          float_num = unformatted_value.to_f
          n         = float_num > 100 ? -1 : float_num
          format_number(n, "%d %%" % float_num)
        when :is_efficient

        when :base_month
          entity_multieditable_tag(entity_class, 'base_month', h(value), options, { :value => unformatted_value.to_s, :type => 'dateui' })
        when :managers_notes
          textilizable(value)
        else
          format_html_issue_attribute_without_modification_easy_patch(entity_class, attribute, unformatted_value, options)
        end
      end
    end

    module ClassMethods

    end
  end
end
EasyExtensions::PatchManager.register_model_patch 'EntityAttributeHelper', 'ModificationEasyPatch::EntityAttributeHelperPatch'
