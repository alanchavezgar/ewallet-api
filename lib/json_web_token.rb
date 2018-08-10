# Implementación del estandar JWT (JSON Web Token)
#
class JsonWebToken
  class << self
    # Autenticación y generación del token del usuario
    def encode(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, Rails.application.credentials.secret_key_base)
    end

    # Decodificación del token
    def decode(token)
      body = JWT.decode(token, Rails.application.credentials.secret_key_base)[0]
      HashWithIndifferentAccess.new body
    end
  end
end
