class CreateUserCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :user_categories, id: :uuid do |t|
      t.uuid :user_id
      t.uuid :category_id

      t.timestamps
    end
  end
end
