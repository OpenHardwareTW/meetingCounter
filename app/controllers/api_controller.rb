class ApiController < ApplicationController
  before_filter :validar_authtoken
  
  # retornar 404 cuando id es no Integer
  # retornar mock cuando id es Integer
  def obtener_pais_con_id
    if params[:id].to_i == 0
      return render_response :not_found
    end
    response = { id: params[:id], nombre: random_word }
    render_response :ok, response
  end
  
  private
  def random_word
    (0...10).map { ('a'..'z').to_a[rand(26)] }.join
  end
  
  def validar_authtoken
    unless request.headers['Authorization']
      return render_response :unauthorized
    end
  end
  
  def render_response status, json = {}
    render json: json, status: status
  end
end
