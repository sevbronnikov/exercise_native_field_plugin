module ModificationEasyCustomFieldMonths
  class Hooks < Redmine::Hook::ViewListener
    #  call_hook(:view_issues_show_details_rows_bottom, issue: @issue, rows: rows)
    render_on :view_issues_show_details_rows_bottom, partial: "native_fields_on_view_issues_show"
  end
end
