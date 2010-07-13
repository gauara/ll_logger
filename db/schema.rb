# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100707171925) do

  create_table "llloggers", :force => true do |t|
    t.datetime "time_at"
    t.string   "node_ip_address",   :limit => 128
    t.string   "node_mac_address",  :limit => 32
    t.string   "node_name",         :limit => 128
    t.integer  "process_id"
    t.integer  "task_list_id"
    t.integer  "task_id"
    t.string   "task_name",         :limit => 128
    t.string   "task_command_line"
    t.string   "severity",          :limit => 15
    t.string   "filename"
    t.string   "module_name"
    t.string   "class_name"
    t.string   "function_name"
    t.integer  "line_number"
    t.text     "stack_trace"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
