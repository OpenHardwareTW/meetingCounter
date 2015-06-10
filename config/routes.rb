MockRespuesta::Application.routes.draw do
  get 'paises/:id' => 'api#obtener_pais_con_id'
  get 'ciudades/:id' => 'api#obtener_pais_con_id'
  get 'archivos' => 'api#obtener_archivo_con_ids'
  get 'personas' => 'api#personas'
  get 'usuario/porToken' => 'api#porToken'
  get 'permisos/porToken' => 'api#permisosPorToken'
  post 'firmaDigital' => 'api#firma_digital'
  post 'firmaDigital/credenciales/validar' => 'api#verificar_contrasenia'
  get 'cantones' => 'api#cantones'
  get 'token/validar' => 'api#validar_token'
  get 'discapacidad/:identificacion' => 'api#consultar_discapacidad'
  post 'archivos/subir' => 'api#subir_archivo'

  get ":regimen/instituciones/nacionales/:id" => 'api#return_nombre_para_regimen'
  get ":regimen/:endpoint/:id" => 'api#return_nombre_para_regimen'
  post "archivos/:id/pdf" => 'api#return_created'
end
