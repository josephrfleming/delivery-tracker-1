class CreateDeliveries < ActiveRecord::Migration[7.1]
  def change
    create_table :deliveries do |t|
      t.string :description
      t.date :expected_on
      t.boolean :received
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
