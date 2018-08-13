module RequestSpecHelper
  # Convierte la respuesta en JSON a un hash
  def json
    JSON.parse(response.body)
  end
end
