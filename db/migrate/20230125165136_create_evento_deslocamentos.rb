class CreateEventoDeslocamentos < ActiveRecord::Migration[7.0]
  def change
    create_table :evento_deslocamentos do |t|
      t.string :descricao
      t.date :data_inicio
      t.date :data_fim
      t.string :cidade
      t.string :link_evento
      t.string :protocolo_despesa
      t.date :data_protocolo
      t.string :link_protocolo
      t.text :ementa

      t.timestamps
    end
  end
end
