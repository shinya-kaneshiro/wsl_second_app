class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title, comment: 'タイトル', :null => false, :limit => 10
      t.text :content, comment: '本文', :null => false
      t.string :image, comment: '画像'
      t.timestamps
    end
  end
end
