class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      # Omniauth only
      t.string :provider
      t.string :uid
      t.string :name

      t.timestamps null: false
    end
  end
end
