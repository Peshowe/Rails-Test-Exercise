class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :sender
      t.text :content
      t.references :conversation, foreign_key: true
      t.datetime :sentOn

      t.timestamps
    end
  end
end
