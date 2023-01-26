class ModeloRelatorioViagem < ApplicationRecord
  has_one_attached :ci_modelo
  has_one_attached :relatorio_modelo
end
