class CreateVocabularies < ActiveRecord::Migration[5.1]
  def change
    create_table :vocabularies do |t|
      t.text :word
      t.text :meaning
      t.text :similarity
      t.text :example
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :vocabularies, [:user_id, :created_at]
  end
end
