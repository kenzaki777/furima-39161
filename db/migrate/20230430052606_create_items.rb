class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,              null: false,foreign_key: true 
      t.string     :item_name,         null: false 
      t.text       :concept,           null: false 
      t.integer    :item_type_id,      null: false
      t.integer    :item_condition_id, null: false
      t.integer    :cost_type_id,      null: false
      t.integer    :sender_area_id,    null: false 
      t.integer    :days_ship_id,       null: false
      t.integer    :price,              null: false
      t.timestamps
    end
  end
end
