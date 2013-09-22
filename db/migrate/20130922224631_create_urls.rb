class CreateUrls < ActiveRecord::Migration
  def up
  	create_table :urls do |t|
  		t.string :url
  		t.string :url_short
  		t.integer :click_count

  		t.timestamps
  	end
  end

  def down
  	drop_table :urls
  end
end
