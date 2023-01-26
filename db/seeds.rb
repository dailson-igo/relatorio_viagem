# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

# Função para estatísticas de tempo para incluir os registros
@last_time = Time.now
@start_time = @last_time
def log_time(label)
  Rails.logger.info(">> ------ Inserindo em [#{label}]: Demorou #{Time.now - @last_time}s, estamos inserindo a #{Time.now - @start_time}s ------ <<")
  @last_time = Time.now
end

# Para maior precisão com o tempo
# https://blog-dnsimple-com.translate.goog/2018/03/elapsed-time-with-ruby-the-right-way/?_x_tr_sl=auto&_x_tr_tl=pt&_x_tr_hl=pt-BR&_x_tr_pto=wapp
# starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)
# # time consuming operation
# ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
# elapsed = ending - starting

# Inserindo Usuários
if Usuario.count == 0
  Usuario.create!(email: 'admin@admin.com', password: 'admin123')
  Usuario.create!(email: 'dailson.araujo@tce.ap.gov.br', password: 'dailson123')
end


# Inserindo Lotações
lotacoes = [
  { descricao: 'Diretoria da Área de Controle Externo', sigla: 'DAEXT', ativa: true },
  { descricao: '1ª Inspetoria de Controle Externo', sigla: '1ª ICE', ativa: true },
  { descricao: '2ª Inspetoria de Controle Externo', sigla: '2ª ICE', ativa: true },
  { descricao: '3ª Inspetoria de Controle Externo', sigla: '3ª ICE', ativa: true },
  { descricao: '4ª Inspetoria de Controle Externo', sigla: '4ª ICE', ativa: true },
  { descricao: '5ª Inspetoria de Controle Externo', sigla: '5ª ICE', ativa: true },
  { descricao: '6ª Inspetoria de Controle Externo', sigla: '6ª ICE', ativa: true },
  { descricao: '7ª Inspetoria de Controle Externo', sigla: '7ª ICE', ativa: true },
  { descricao: '8ª Inspetoria de Controle Externo', sigla: '8ª ICE', ativa: false }
]

lotacoes.each do |record|
  if Lotacao.where(descricao: record[:descricao]).present? == false
    Lotacao.create!(record)
    log_time('Lotação')
  end
end

# Inserindo Servidores
1_000.times do |i|
  Servidor.create!(nome: "Servidor#{i} Sobrenome#{i}", matricula: "#{i}", lotacao_id: rand(1..9))
  log_time('Servidor')
end

(1000..1100).each do |i|
  Servidor.create!(nome: "Servidor#{i} Sobrenome#{i}", matricula: "#{i}", lotacao_id: rand(1..9))
  log_time('Servidor')
end