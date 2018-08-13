class Message
  def self.not_found(record = 'record')
    "#{record} no encontrado"
  end

  def self.invalid_credentials
    'Credenciales inválidas'
  end

  def self.invalid_token
    'Token inválido'
  end

  def self.missing_token
    'Falta el token'
  end

  def self.unauthorized
    'Solicitud no autorizada'
  end

  def self.account_created
    'Cuenta creada correctamente'
  end

  def self.account_not_created
    'La cuenta no puedo ser creada'
  end

  def self.expired_token
    'Tu token ha expirado. Identifícate para continuar'
  end
end
