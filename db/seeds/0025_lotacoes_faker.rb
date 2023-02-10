# Inserindo Lotações
# Usando a gem Faker

11.times do
  Lotacao.create!(descricao: Faker::Team.unique.name, ativa: true)
end
