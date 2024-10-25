class CreateContacts < ActiveRecord::Migration[8.0]
  def change
    create_table :contacts do |t|
      t.string :content
      t.string :kind, null: false, default: "phone"
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
