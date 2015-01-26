MockRespuesta::Application.routes.draw do
  get 'paises/:id' => 'api#obtener_pais_con_id'
  get 'archivos' => 'api#obtener_archivo_con_ids'
  get 'personas' => 'api#personas'
  get 'usuario/porToken' => 'api#porToken'
  post 'firmaDigital' => 'api#firma_digital'
  post 'firmaDigital/credenciales/validar' => 'api#verificar_contrasenia'
end
