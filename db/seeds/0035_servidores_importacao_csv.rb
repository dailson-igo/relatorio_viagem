# frozen_string_literal: true

require 'csv'
require 'open-uri'

# Importação de arquivo da internet
# https://github.com/rgeurgas/dipirona/blob/master/tabela_salarios.csv
# arquivo_externo = 'https://raw.githubusercontent.com/rgeurgas/dipirona/master/tabela_salarios.csv'
# dados_csv = URI.open(arquivo_externo)

# Importação de arquivo local
arquivo_interno = Rails.root.join('db/dados/tabela_salarios_local.csv')
dados_csv = File.open(arquivo_interno)

# Estrutura do arquivo com 14.326 registros
# id,     nome,                         remBru,   ind,      red,      desc,     remLiq
# 76872,  PATRICIA MARIA MORATO LOPES,  68030.25, 0.00,     8360.13,  19884.72, 39785.40
# 181803, OCTACILIO MACHADO RIBEIRO,    62213.92, 14828.96, 9100.18,  20804.62, 47138.08

puts '------------------------'
servidor_atual = 0
CSV.foreach(dados_csv, headers: true) do |servidor|
  servidor_atual += 1

  puts "--> INSERINDO O #{servidor_atual}º REGISTRO CSV <--"
  puts "Nome do servidor: #{servidor['nome']}"
  puts "Matrícula do servidor: #{servidor['id']}"
  Servidor.create!(
    {
      nome: servidor['nome'].formatar_nome,
      matricula: servidor['id'],
      lotacao_id: rand(1..9)
    }
  )

  # Insere no máximo 100 registros dos 14.326 registros e sai
  # Comente a linha abaixo se quiser inserir todos
  break if servidor_atual == 100

  puts '------------------------'
end

dados_csv.close
