class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :robo_hash, null: false, default: "robo_hash"

      t.timestamps
    end
  end
end
