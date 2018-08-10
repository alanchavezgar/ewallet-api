class AutorizarSolicitud
  prepend SimpleCommand

  def initialize(headers = {})
    @headers = headers
  end

  def call
    user
  end

  private

  attr_reader :headers

  def user
    @user ||= Sistema::Usuario.find(decoded_auth_token[:user_id]) if decoded_auth_token
    @user || errors.add(:token, 'Token inválido') && nil
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    else
      errors.add(:token, 'No se encontró el token')
    end
    nil
  end
end
