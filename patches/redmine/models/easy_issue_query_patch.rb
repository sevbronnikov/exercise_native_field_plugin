module ModificationEasyPatch
  module EasyIssueQueryPatch

    def self.included(base)
      base.extend(ClassMethods)
      base.include(InstanceMethods)

      base.class_eval do

        alias_method_chain :initialize_available_filters, :modification_easy_patch
        alias_method_chain :initialize_available_columns, :modification_easy_patch

      end
    end

    module InstanceMethods

      def initialize_available_filters_with_modification_easy_patch
        initialize_available_filters_without_modification_easy_patch

        group = l(:modification_easy_issue_query_name)
        on_filter_group(group) do
          add_available_filter 'partner_id', { type: :integer, attr_reader: true, most_used: true }
          add_available_filter 'kpi_ratio', { type: :decimal, attr_reader: true, attr_writer: false }
          add_available_filter 'is_efficient', { type: :boolean }
          add_available_filter 'base_month', { type: :date }
          add_available_filter 'managers_notes', { type: :text, attr_reader: true, inline: false  }
        end
      end

      def initialize_available_columns_with_modification_easy_patch
        initialize_available_columns_without_modification_easy_patch

        group = l(:modification_easy_issue_query_name)
        @available_columns << EasyQueryColumn.new(:partner_id, sortable: "#{Issue.table_name}.partner_id", group: group)
        @available_columns << EasyQueryColumn.new(:kpi_ratio, sortable: "#{Issue.table_name}.kpi_ratio", group: group, numeric: true, no_progress_bar: true)
        @available_columns << EasyQueryColumn.new(:is_efficient, sortable: "#{Issue.table_name}.is_efficient", group: group)
        @available_columns << EasyQueryColumn.new(:base_month, sortable: "#{Issue.table_name}.base_month", group: group)
        @available_columns << EasyQueryColumn.new(:managers_notes, sortable: "#{Issue.table_name}.managers_notes", group: group, inline: false)
      end
    end

    module ClassMethods

    end
  end
end
EasyExtensions::PatchManager.register_model_patch 'EasyIssueQuery', 'ModificationEasyPatch::EasyIssueQueryPatch'

