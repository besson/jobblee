class CreateBubbles < ActiveRecord::Migration
  def change
    create_table :bubbles do |t|
      t.string :name
      t.float :value
      t.belongs_to :metric

      t.timestamps
    end
  end
end
