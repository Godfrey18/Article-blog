class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
    	t.string :name
    	t.text :discription
    	t.timestamps
    end
  end
end
