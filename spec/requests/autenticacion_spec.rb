require 'rails_helper'

RSpec.describe 'Autenticacion', type: :request do
  describe 'POST /login' do
    let!(:usuario) { create(:sistema_usuario) }
    let(:headers) { valid_headers.except('Authorization') }
    let(:credenciales_validas) do
      {
        email: usuario.email,
        password: usuario.password
      }.to_json
    end

    let(:credenciales_invalidas) do
      {
        email: Faker::Internet.email,
        password: Faker::Internet.password
      }.to_json
    end

    context 'Cuando la solicitud es válida' do
      before { post '/login', params: credenciales_validas, headers: headers }

      it 'regresa el token de autenticación' do
        expect(json['auth_token']).not_to be_nil
      end
    end

    context 'Cuando la solicitud no es válida' do
      before { post '/login', params: credenciales_invalidas, headers: headers }

      it 'regresa un mensaje de falla' do
        expect(json['message']).to match("Credenciales inválidas")
      end
    end
  end
end
