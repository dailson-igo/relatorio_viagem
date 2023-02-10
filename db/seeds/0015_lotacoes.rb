# Inserindo Lotações
# Usando um array[] lotacoes de hashes { chave1: 'valor1', chave2: 'valor2'}
# Inserindo somente se NÃO existir um registro com a descrição, com "Lotacao.where(descricao: registro[:descricao]).present? == false"
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

lotacoes.each do |registro|
  Lotacao.create!(registro) if Lotacao.where(descricao: registro[:descricao]).present? == false
end
