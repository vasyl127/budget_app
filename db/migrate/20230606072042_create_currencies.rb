class CreateCurrencies < ActiveRecord::Migration[7.0]
  def change
    create_table :currencies, id: :uuid do |t|
      t.json :usd
      t.json :eur

      t.timestamps
    end
  end
end
