module ModificationEasyPatch
  module FieldFormatsPatch

    class MonthSelect < Redmine::FieldFormat::ListFormat
      add 'month_select'

      self.form_partial         = nil
      self.type_for_inline_edit = 'select'

      def label
        :label_month_select
      end

      #def validate_custom_value(custom_value)
      #  values         = Array.wrap(custom_value.value).reject(&:blank?)
      #  invalid_values = values -
      #    Array.wrap(custom_value.value_was) - ISO3166::Country.codes
      #  if invalid_values.any?
      #    [::I18n.t('activerecord.errors.messages.inclusion')]
      #  else
      #    []
      #  end
      #  []
      #end

      def validate_custom_field(custom_field)
        []
      end



    end
  end
end
