class CreateLotacoes < ActiveRecord::Migration[7.0]
  def change
    create_table :lotacoes do |t|
      t.string :descricao, null: false
      t.string :sigla, limit: 20
      t.boolean :ativa

      t.timestamps
    end
  end
end
