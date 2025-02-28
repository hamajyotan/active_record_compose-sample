class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.datetime :resigned_at, null: true

      t.timestamps
    end
  end
end
