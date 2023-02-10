# Inserindo Servidores
# Usando a gem Faker
# Assossia, de forma aleatória, cada servidor à uma das lotações com id de 10 a 20 inseridas com o Faker
50.times do |i|
  Servidor.create!(nome: Faker::Name.unique.name_with_middle, matricula: rand(30..300), lotacao_id: rand(10..20))
end