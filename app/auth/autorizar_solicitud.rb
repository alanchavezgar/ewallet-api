class AutorizarSolicitud

  def initialize(headers = {})
    @headers = headers
  end

  def call
    {
      usuario: user
    }
  end

  private

  attr_reader :headers

  def user
    @user ||= Sistema::Usuario.find(decoded_auth_token[:usuario_id]) if decoded_auth_token
  rescue ActiveRecord::RecordNotFound => e
    raise(
      ExceptionHandler::InvalidToken,
      ("#{Message.invalid_token} #{e.message}")
    )
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    else
      raise(ExceptionHandler::MissingToken, Message.missing_token)
    end
    nil
  end
end
