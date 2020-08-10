class CreateFixResponse < ActiveRecord::Migration[5.2]
  def change
    create_table :fix_responses do |t|
      remove_column :responses, :reply
    end
  end
end
