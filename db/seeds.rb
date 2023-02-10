# frozen_string_literal: true

include MetodosCompartilhados

# Separação dos seeds em arquivos diferentes, executando os seeds por ordem de nome
# De acordo com o artigo
# https://blog.magmalabs.io/2019/11/25/best-practices-using-rails-seeds.html

# Por segurança. inclui a carga inicial somente se
# Não existir nenhum registro na tabela usuarios
# E o ambiente for de desenvolvimento
if Usuario.count == 0 && Rails.env.development?

  Faker::Config.locale = 'pt-BR'

  ultima_execucao = Time.now
  inicio_execucao = ultima_execucao
  Dir[Rails.root.join('db/seeds/*.rb')].sort.each do |arquivo|
    puts "--> Processando o arquivo #{arquivo.split('/').last} <--"
    require arquivo

    registrar_tempo_execucao(arquivo.split('/').last, ultima_execucao, inicio_execucao)
    ultima_execucao = Time.now
  end

  puts '----------------------------------------------------------------'
  puts '[SUCESSO!] TÉRMINO DA CARGA INICIAL DE DADOS DE TESTE USANDO rails db:seed'
  puts '----------------------------------------------------------------'
else
  puts '----------------------------------------------------------------'
  puts '[ERRO!] CARGA INICIAL DE DADOS NÃO REALIZADA.'
  puts 'OS DADOS DE TESTE SÕ SERÃO INSERIDOS SE NÃO EXISTIR'
  puts 'NENHUM USUÁRIO CADASTRADO NA TABELA usuarios'
  puts 'E O AMBIENTE FOR DE DESENVOLVIMENTO  (development)'
  puts '----------------------------------------------------------------'
end
