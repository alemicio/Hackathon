class CreateBikeAccounts < ActiveRecord::Migration
  def change
    create_table :bike_accounts do |t|
      t.belongs_to :user, home: true

      t.timestamps null: false
    end
  end
end
