# frozen_string_literal: true

include MetodosCompartilhados
class EventoDeslocamento < ApplicationRecord
  before_validation :remover_espacos
  validates :data_inicio, presence: true, comparison: { less_than_or_equal_to: :data_fim }
  validates :data_fim, presence: true

  rails_admin do
    navigation_label 'Relatório de Viagem'
    navigation_icon 'fas fa-chalkboard-teacher'
    weight(-20)

    # Label do menu
    label         'Evento ou Deslocamento'
    label_plural  'Eventos ou Deslocamentos'

    field(:descricao)   { label 'Descrição' }
    field(:data_inicio) { label 'Início' }
    field(:data_fim)    { label 'Término' }
    field(:cidade)      { label 'Cidade' }
    field(:link_evento) { label 'Link do Evento' }
    field(:protocolo_despesa) { label 'Protocolo da Despesa' }
    field(:data_protocolo)    { label 'Data do Protocolo' }
    field(:link_protocolo)    { label 'Link do Protocolo' }

    show do
      field(:ementa)
    end

    edit do
      field(:ementa)
    end
  end
end
