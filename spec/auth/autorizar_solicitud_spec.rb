require 'rails_helper'

RSpec.describe AutorizarSolicitud do
  let(:usuario) { create(:sistema_usuario) }
  let(:header) { { 'Authorization' => token_generator(usuario.id) } }

  subject(:solicitud) { described_class.new(header) }
  subject(:solicitud_invalida) { described_class.new({}) }

  describe '#call' do

    context 'cuando se hace la solicitud' do
      it 'regresa el objeto usuario' do
        resultado = solicitud.call
        expect(resultado[:usuario]).to eq(usuario)
      end
    end

    context 'cuando la solicitud no es válida' do
      context 'cuando falta el token' do
        it 'muestra el error MissingToken' do
          expect { solicitud_invalida.call }
            .to raise_error(ExceptionHandler::MissingToken, 'Falta el token')
        end
      end

      context 'cuando el token no es válido' do
        subject(:solicitud_invalida) do
          described_class.new('Authorization' => token_generator(1))
        end

        it 'muestra un error InvalidToken' do
          expect { solicitud_invalida.call }
            .to raise_error(ExceptionHandler::InvalidToken, 'Token inválido')
        end
      end

      context 'cuando el token ha expirado' do
        let(:header) { {'Authorization' => expired_token_generator(usuario.id) } }
        subject(:solicitud) { described_class.new(header) }

        it 'muestra un error ExceptionHandler::ExpiredSignature' do
          expect { solicitud.call }
            .to raise_error(
              ExceptionHandler::InvalidToken, /Signature has expired/
            )
        end
      end

      context 'token falso' do
        let(:header) { { 'Authorization' => 'foobar' } }
        subject(:solicitud_invalida) { described_class.new(header) }

        it 'maneja JWT::DecodeError' do
          expect { solicitud_invalida.call }
            .to raise_error(
            ExceptionHandler::InvalidToken, /Not enough or too many segments/
          )
        end
      end
    end
  end
end
