# frozen_string_literal: true

include MetodosCompartilhados
class ModeloRelatorioViagem < ApplicationRecord
  has_one_attached :ci_modelo
  has_one_attached :relatorio_modelo

  attr_accessor :remove_ci_modelo, :remove_relatorio_modelo

  before_validation :remover_espacos
  after_save { ci_modelo.purge if remove_ci_modelo == '1' }
  after_save { relatorio_modelo.purge if remove_relatorio_modelo == '1' }

  rails_admin do
    navigation_label 'Relatório de Viagem'
    navigation_icon  'fas fa-file-arrow-up'
    weight(-30)

    # Label do menu
    label        'Modelo de Relatório'
    label_plural 'Modelos de Relatório'

    field(:descricao) { label 'Descrição' }

    field :ci_modelo, :active_storage do
      label 'Modelo de CI'
      pretty_value do
        if value
          path = Rails.application.routes.url_helpers.rails_blob_path(value, only_path: true)
          bindings[:view].content_tag(:a, value.filename, href: path)
        end
      end
    end

    field :relatorio_modelo, :active_storage do
      label 'Modelo de Relatório'
      pretty_value do
        if value
          path = Rails.application.routes.url_helpers.rails_blob_path(value, only_path: true)
          bindings[:view].content_tag(:a, value.filename, href: path)
        end
      end
    end

    field(:created_at) do
      label 'Criado em'
      read_only true
    end
  end
end
