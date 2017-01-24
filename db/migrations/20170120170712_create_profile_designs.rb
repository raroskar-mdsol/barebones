# class CreateProfileDesigns < Sequel::Migration
#   def up
#     create_table :profile_designs do |t|
#       t.string   :uuid, :limit => 50, :null => false
#       t.string   :name, :limit => 200, null => false
#       t.datetime :created_at, :null => false
#       t.datetime :updated_at, :null => false
#     end
#   end
#
#   def down
#     drop_table :profile_designs
#   end
#
# end


Sequel.migration do
  up do
    create_table :study_datasets do
      column :uuid, String, size: 255, null: false, unique: true
      column :name, String, size: 500, null: false
    end
  end

  down do
    drop_table :study_datasets
  end
end