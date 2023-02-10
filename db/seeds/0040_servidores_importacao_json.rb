# frozen_string_literal: true

require 'json'
require 'open-uri'

# https://transparencia.al.gov.br/portal/api/pessoal/servidores-ativos/lista-de-servidores
# A lista completa possui cerca de 45.764 registros
# Mas a requisição retorna apenas 5 registros (limit=5) para teste
# arquivo_externo = 'http://transparencia.al.gov.br/pessoal/json-servidores/?ano=2022&mes=12&limit=5&offset=0'
# dados_json = URI.open(arquivo_externo).read

# Importação de arquivo local
# arquivo_interno = Rails.root.join('db/dados/servidores_5_registros.json')
arquivo_interno = Rails.root.join('db/dados/servidores_45764_registros.json')
dados_json = File.open(arquivo_interno).read

# Quando linha[0] == rows, o 4º elemento deste arquivo JSON
# O elemento linha[1] dentro de rows é um array [] com vários hashes {}, e cada hash com informações de um servidor
#
# Estrutura do arquivo
# {
#   "total": 45764,
#   "titulo": "Listagem de Servidores Ativos",
#   "detalhe":
#     {
#       "total__sum": "193.498.826,10"
#     },
#   "rows":
#     [
#       {
#         "horas_extras": "0",
#         "codigo_orgao": "PO",
#         "nome": "AARAO JOSE DA SILVA",
#         "ano": 2022,
#         "cpf": "###.845.4##-##",
#         "funcionario_id": 1,
#         "mes": 12,
#         "descricao_orgao": "PERICIA OFICIAL DO ESTADO DE ALAGOAS",
#         "total": "9.412,71",
#         "id": 2022120097076,
#         "numero_ordem": 97076
#       },
# (Continua ...)

# Para acessar diretamente o elemento rows do JSON
# Poderia usar
# JSON.parse(dados_json)['rows']
# Mas mudaria bastante na lógica que está percorrendo os dados com "JSON.parse(dados_json).each do |_elemento|"

# Para percorrer todos os elementos do JSON
puts '------------------------'
elemento_atual = 0
JSON.parse(dados_json).each do |elemento|
  elemento_atual += 1
  # puts "Inspecionando o #{elemento_atual}º elemento JSON, com chave e valor = #{elemento[0]}: #{elemento[1]}"

  # Ignora os elementos JSON até chegar em 'rows'
  next unless elemento[0] == 'rows'

  # Para cada servidor dentro do hash do elemento rows
  puts '------------------------'
  servidor_atual = 0
  elemento[1].each do |servidor|
    servidor_atual += 1

    puts "--> INSERINDO O #{servidor_atual}º REGISTRO JSON <--"
    puts "Nome do servidor: #{servidor['nome']}"
    Servidor.create!(
      {
        nome: servidor['nome'].formatar_nome,
        matricula: servidor['funcionario_id'],
        lotacao_id: rand(1..9)
      }
    )

    # Insere no máximo 100 registros dos 14.326 registros e sai
    # Comente a linha abaixo se quiser inserir todoss
    break if servidor_atual == 100

    puts '------------------------'
  end
end
