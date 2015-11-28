class CreateCarAccounts < ActiveRecord::Migration
  def change
    create_table :car_accounts do |t|
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
