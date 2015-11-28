class CreateAtms < ActiveRecord::Migration
  def change
    create_table :atms do |t|
      t.belongs_to :user, home: true

      t.timestamps null: false
    end
  end
end
