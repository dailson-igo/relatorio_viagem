# frozen_string_literal: true

include MetodosCompartilhados

class Servidor < ApplicationRecord
  belongs_to :lotacao, optional: true
  has_one_attached :foto

  attr_accessor :remove_foto

  after_save { foto.purge if remove_foto == '1' }

  before_validation :remover_espacos
  validates :nome, presence: true, length: { minimum: 7 } # YUZO IANO
  validates :matricula, numericality: { only_integer: true }, allow_blank: true

  rails_admin do
    navigation_label 'Relatório de Viagem'
    navigation_icon  'fas fa-id-card'
    weight(-40)

    field(:nome)
    field(:matricula) do
      label 'Matrícula'
      help 'Apenas números'
    end
    field(:cargo_funcao) { label 'Cargo/Função' }
    field :lotacao do
      label 'Lotação'
      inline_add false
      inline_edit false
    end

    list do
      sort_by :nome

      field :foto do
        # Default thumb size: thumb_method resize_to_limit: [100, 100]
        thumb_method resize_to_limit: [50, 50]
        filterable false
        sortable false
      end
    end

    show do
      # Default thumb size: thumb_method resize_to_limit: [100, 100]
      field :foto do
        thumb_method resize_to_limit: [150, 150]
      end
    end

    edit do
      field :foto do
        # Default thumb size: thumb_method resize_to_limit: [100, 100]
        thumb_method resize_to_limit: [300, 300]
      end
    end
  end
end
