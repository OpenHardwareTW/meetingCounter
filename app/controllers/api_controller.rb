require 'securerandom'

class ApiController < ApplicationController
  before_filter :validar_authtoken, except: [:obtener_pais_con_id, :consultar_discapacidad, :subir_archivo]
  protect_from_forgery only: [:nothing]

  # retornar 404 cuando id es no Integer
  # retornar mock cuando id es Integer
  def obtener_pais_con_id
    if params[:id].to_i == 0
      return render_response :not_found
    end
    response = { id: params[:id], nombre: random_word }
    render_response :ok, response
  end

  def obtener_archivo_con_ids
    archivos = {
              elementos: [
                          {
                              id: 130,
                              nombre: "NihpMMjSfO4909040394484558758.doc",
                              ruta: "/tmp/2404f5b8-d21d-4c30-92e2-2f5c2311c39e-NihpMMjSfO4909040394484558758.doc"
                          },
                          {
                              id: 131,
                              nombre: "dYOvuxPDfY5838682484897547294.doc",
                              ruta: "/tmp/6dcd2775-78fe-42a5-b291-cc098a2e7033-dYOvuxPDfY5838682484897547294.doc"
                          }
                      ]
          }

    unless params[:hash].blank?
      archivos[:elementos] = archivos[:elementos].collect do |elemento|
        elemento[:hash] = random_word
        elemento[:algoritmoHash] = params[:hash]
        elemento
      end
    end

    render_response :ok, archivos
  end

  def firma_digital
    parametros = [params[:nombreUsuario], params[:textoAFirmar], params[:contrasenia]].select{ |x| !x.blank? }
    if parametros.count < 3
      return render_response :unprocessable_entity
    end
    response = { id: random_word }
    render_response :ok, response
  end

  def verificar_contrasenia
    if params[:contrasenia].length < 10
     return render_response :not_found
    end
    render_response :ok
  end

  def personas
    names = []
    10.times do
      names << {nombre: random_word}
    end
    render_response :ok, names
  end

  def porToken
    user = {permisosArbol: random_word, institucion: {idInstitucion: 1001}}
    render_response :ok, user
  end

  def permisosPorToken
    permisos = {elementos:[{id:1, acceso: 'CREAR', modulo: 'Administración de usuarios', funcion: 'Gestionar Usuarios', nombrePermiso: 'crear_usuarios'}]}
    render_response :ok, permisos
  end

  def cantones
    cantones = {elementos:[{id:'0101', nombre:'Cuenca', idZona:'06'}, {id:'0102', nombre:'Giron', idZona:'06'}, {id:'0103', nombre:'Gualaceo', idZona:'06'}]}
    render_response :ok, cantones
  end

  def validar_token
    usuario = request.headers['x-token'] == 'token' ? 'admin' : ''
    render text: usuario
  end

  def consultar_discapacidad
    discapacidad = {deficienciaPredomina:'fisica'}
    render_response :ok, discapacidad
  end

  def subir_archivo
    render text: SecureRandom.uuid, status: :created
  end

  private
  def random_word
    (0...10).map { ('a'..'z').to_a[rand(26)] }.join
  end

  def validar_authtoken
    unless ( request.headers['Authorization'] || request.headers['x-token'] )
      return render_response :unauthorized
    end
  end

  def render_response status, json = {}
    render json: json, status: status
  end
end
