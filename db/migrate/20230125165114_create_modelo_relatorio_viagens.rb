class CreateModeloRelatorioViagens < ActiveRecord::Migration[7.0]
  def change
    create_table :modelo_relatorio_viagens do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
