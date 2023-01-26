class Lotacao < ApplicationRecord
  has_many :servidores

  # Garagem, 7 caracteres
  validates :descricao, presence: true, length: {minimum: 7}
  # Sigla DA, de Departamento Administrativo
  validates :sigla, length: {minimum: 2}
end
