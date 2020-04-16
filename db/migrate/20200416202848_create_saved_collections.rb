class CreateSavedCollections < ActiveRecord::Migration[6.0]
  def change
    create_table :saved_collections do |t|

      t.timestamps
    end
  end
end
