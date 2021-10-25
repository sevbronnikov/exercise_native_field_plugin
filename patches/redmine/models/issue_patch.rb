module ModificationEasyCustomFieldMonths
  module IssuePatch

    def self.included(base)
      base.extend(ClassMethods)
      base.include(InstanceMethods)

      base.class_eval do
        belongs_to :partner, :class_name => "User", foreign_key: :partner_id

        safe_attributes('partner_id',
          :if => lambda { |issue, user| issue.new_record? || issue.attributes_editable?(user) })
        safe_attributes('kpi_ratio')
        safe_attributes('is_efficient')
        safe_attributes('base_month')
        safe_attributes('managers_notes')
      end
    end

    module InstanceMethods

    end

    module ClassMethods

    end
  end
end
EasyExtensions::PatchManager.register_model_patch 'Issue', 'ModificationEasyCustomFieldMonths::IssuePatch'
