class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.string :title1
      t.integer :content1
      t.string :title2
      t.integer :content2
      t.string :title3
      t.integer :content3
      t.string :at1
      t.integer :ac1
      t.string :at2
      t.integer :ac2
      t.string :at3
      t.integer :ac3
      t.text :memo
	  t.integer :user_id

      t.timestamps
    end
  end
end
