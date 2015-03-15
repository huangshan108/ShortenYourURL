class CreateMappings < ActiveRecord::Migration
  def change
    create_table :mappings do |t|
    	t.text :url
      t.timestamps null: false
    end
  end
end
