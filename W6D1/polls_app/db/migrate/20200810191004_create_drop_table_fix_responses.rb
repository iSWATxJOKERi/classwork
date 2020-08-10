class CreateDropTableFixResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :drop_table_fix_responses do |t|
      drop_table :fix_responses
    end
  end
end
