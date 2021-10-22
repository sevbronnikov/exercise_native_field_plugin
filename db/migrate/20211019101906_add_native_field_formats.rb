class AddNativeFieldFormats < ActiveRecord::Migration[6.1]

  def change
    add_column :projects, :partner_id, :integer, :default => nil
    add_column :projects, :kpi_ratio, :decimal, :precision => 4, :scale => 2, :default => nil
    add_column :projects, :is_efficient, :boolean, :default => false
    add_column :projects, :base_month, :date, :default => nil
    add_column :projects, :managers_notes, :text

    add_column :issues, :partner_id, :integer, :default => nil
    add_column :issues, :kpi_ratio, :decimal, :precision => 4, :scale => 2, :default => nil
    add_column :issues, :is_efficient, :boolean, :default => false
    add_column :issues, :base_month, :date, :default => nil
    add_column :issues, :managers_notes, :text
  end

end


