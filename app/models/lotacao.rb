# frozen_string_literal: true

include MetodosCompartilhados

class Lotacao < ApplicationRecord
  has_many :servidores
  belongs_to :chefe, class_name: 'Servidor', optional: true

  # Autorelacionamento ou relacionamento reflexivo
  has_many :lotacoes_vinculadas, class_name: 'Lotacao', foreign_key: 'lotacao_vinculante_id'
  belongs_to :lotacao_vinculante, class_name: 'Lotacao', optional: true

  before_validation :remover_espacos
  # Copa, 4 caracteres
  validates :descricao, presence: true, length: { minimum: 4 }
  # Sigla DA, de Departamento Administrativo
  validates :sigla, length: { minimum: 2 }, allow_blank: true

  before_save :antes_de_salvar

  rails_admin do
    # Grupo do menu
    navigation_label  'Relatório de Viagem'
    navigation_icon   'fas fa-store-alt'
    weight(-50)

    # Label do menu
    label         'Lotação'
    label_plural  'Lotações'

    field(:descricao) { label 'Descrição' }
    field(:sigla)
    field(:ativa)
    field :chefe do
      inline_add false
      inline_edit false
    end
    field :lotacao_vinculante do
      label 'Lotação Vinculante'
      inline_add false
      inline_edit false
    end

    list do
      sort_by :descricao
    end

    show do
      field(:lotacoes_vinculadas) { label 'Lotações Vinculadas' }
      field(:servidores)
    end
  end

  private

  def antes_de_salvar
    sigla.upcase! if sigla.respond_to?(:upcase)
  end
end
