module MetodosCompartilhados
  extend ActiveSupport::Concern

  included do
    def remover_espacos
      attributes.each_value { |v| v.squish! if v.respond_to?(:squish!) && !v.match?('\n') }
    end

    def registrar_tempo_execucao(rotulo, ultima_execucao, inicio_execucao)
      ultima_execucao = Time.at(Time.now - ultima_execucao).utc.strftime('%Hh%Mmin:%Ss.%Lms')
      inicio_execucao = Time.at(Time.now - inicio_execucao).utc.strftime('%Hh%Mmin:%Ss.%Lms')
      mensagem = ">> ------ Inserindo usando [#{rotulo}]: Demorou #{ultima_execucao}, estamos inserindo a #{inicio_execucao} ------ <<"
      Rails.logger.info(mensagem)
      puts mensagem
    end
  end
end
