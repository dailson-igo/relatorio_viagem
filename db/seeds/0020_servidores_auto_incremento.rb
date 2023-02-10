# Inserindo Servidores usando sequencial com times (vezes).
# Usando 10.times vai de zero a 9
# Assossia, de forma aleatória, cada servidor à uma das 9 lotações inseridas
10.times do |i|
  Servidor.create!(nome: "Servidor#{i} da Silva do Sobrenome#{i}", matricula: "#{i}", lotacao_id: rand(1..9))
end

# Inserindo Servidores usando sequencial com range (intervalo), de 10 a 20
# Assossia, de forma aleatória, cada servidor à uma das 9 lotações inseridas
(10..20).each do |i|
  Servidor.create!(nome: "Servidor#{i} de Sousa do Sobrenome#{i}", matricula: "#{i}", lotacao_id: rand(1..9))
end
