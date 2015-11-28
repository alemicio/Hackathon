class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.belongs_to :user, home: true

      t.string :home
      t.timestamps null: false
    end
  end
end
