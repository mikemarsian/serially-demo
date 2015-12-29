class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :drafted_by
      t.string :reviewed_by
      t.string :published_by

      t.timestamps null: false
    end
  end
end
