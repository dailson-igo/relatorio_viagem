# Inserindo Usuários, se a tabela estiver vazia
# Usando diretamente o método create da classe Usuario, da tabela usuarios
if Usuario.count == 0
  Usuario.create!(email: 'admin@admin.com', password: 'admin123')
  # Usuario.create!(email: 'usuario.compapel1@usuario.com', password: 'usuario123')
  # Usuario.create!(email: 'usuario.compapel2@usuario.com', password: 'usuario123')
end
