class CreateLlloggers < ActiveRecord::Migration
  def self.up
    create_table :llloggers do |t|
      t.column :time_at, :datetime
      t.column :node_ip_address, :string, :limit => 128
      t.column :node_mac_address, :string, :limit => 32
      t.column :node_name, :string, :limit => 128
      t.column :process_id, :integer
      t.column :task_list_id, :integer
      t.column :task_id, :integer
      t.column :task_name, :string, :limit => 128
      t.column :task_command_line, :string
      t.column :severity, :string, :limit => 15
      t.column :filename, :string
      t.column :module_name, :string
      t.column :class_name, :string
      t.column :function_name, :string
      t.column :line_number, :integer
      t.column :stack_trace, :text, :limit => 2048
      t.column :message, :text, :limit => 2048

      t.timestamps
    end
  end

  def self.down
    drop_table :llloggers
  end
end
