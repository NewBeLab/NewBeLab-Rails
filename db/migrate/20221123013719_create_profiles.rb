class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :times_link
      t.string :commitment, null: false
      t.string :position, null: false
      t.string :motivation, null: false
      t.text :self_introduction
      t.string :phase, null: false
      t.integer :grade, null: false
      t.string :editor
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :profiles, [:user_id, :times_link], unique: true
  end
end
