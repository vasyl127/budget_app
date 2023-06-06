class CreateCosts < ActiveRecord::Migration[7.0]
  def change
    create_table :costs, id: :uuid do |t|
      t.uuid :user_id
      t.uuid :category_id

      t.string :name
      t.float :value, default: 0
      t.string :func, default: 'minus'
      t.json :currency

      t.timestamps
    end
  end
end