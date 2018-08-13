require 'rails_helper'

RSpec.describe AutenticarUsuario do
  let(:usuario) { create(:sistema_usuario) }

  subject(:autorizacion_valida) { described_class.new(usuario.email, usuario.password) }
  subject(:autorizacion_invalida) { described_class.new('foo', 'bar') }

  describe '#call' do
    context 'cuando las credenciales son válidas' do
      it 'regresa el token de autorización' do
        token = autorizacion_valida.call
        expect(token).not_to be_nil
      end
    end

    context 'cuando las credenciales no son válidas' do
      it 'muestra un error de autenticación' do
        expect { autorizacion_invalida.call }
          .to raise_error(
            ExceptionHandler::AuthenticationError,
            "Credenciales inválidas"
        )
      end
    end
  end

end
