# frozen_string_literal: true

module MinhasExtensoes
  module String
    def formatar_nome
      # Baseada nas respostas do link
      # https://stackoverflow.com/questions/15078964/ruby-titleize-how-do-i-ignore-smaller-words-like-and-the-or-etc
      # Para converter JOSÉ DA SILVA E SOUSA para José da Silva e Sousa
      palavras_excluidas = %w[a e i o u ao aos as nos nós no na mas mes da de di do das des del dos]
      split(' ').map do |palavra|
        palavra.downcase!
        palavras_excluidas.include?(palavra) ? palavra : palavra.titleize
      end.join(' ')
    end
  end
end
