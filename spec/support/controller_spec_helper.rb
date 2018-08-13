module ControllerSpecHelper

  def token_generator(usuario_id)
    JsonWebToken.encode(usuario_id: usuario_id)
  end

  def expired_token_generator(usuario_id)
    JsonWebToken.encode({ usuario_id: usuario_id }, (Time.now.to_i - 10))
  end

  def valid_headers
    {
      "Authorization" => token_generator(usuario.id),
      "Content-Type" => "application/json"
    }
  end

  def invalid_headers
    {
      "Authorization" => nil,
      "Content-Type" => "application/json"
    }
  end
end
