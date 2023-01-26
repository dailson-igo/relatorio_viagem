class CreateServidores < ActiveRecord::Migration[7.0]
  def change
    create_table :servidores do |t|
      t.string :nome
      t.integer :matricula
      t.string :cargo_funcao
      t.references :lotacao, null: false, foreign_key: true

      t.timestamps
    end
  end
end
