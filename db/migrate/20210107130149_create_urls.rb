class CreateUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :urls do |t|
      t.string :original_url
      t.string :shortner_url
      t.string :name

      t.timestamps
    end
  end
end
