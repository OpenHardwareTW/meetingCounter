require 'json'

class ApiController < ApplicationController
  protect_from_forgery only: [:nothing]

  $contador = 0

  def contarPersonas

    if params[:estado].to_i == 1
      $contador += 1
    else
      $contador -= 1
      if $contador < 0 
        $contador = 0
      end
    end

    distancia = params[:distancia]

    respuesta = { 'contador': $contador, 'distancia': distancia }
    render_response :created, respuesta
  end

  def reiniciarContador
    $contador = 0

    respuesta = { 'contador': $contador }
    render_response :created, respuesta
  end 

  def render_response status, json = {}
    render json: json, status: status
  end
end
