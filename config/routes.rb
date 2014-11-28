MockRespuesta::Application.routes.draw do
  get 'paises/:id' => 'api#obtener_pais_con_id'
  get 'archivos' => 'api#obtener_archivo_con_ids'
  post 'firmaDigital' => 'api#firma_digital'
  post 'firmaDigital/credenciales/validar' => 'api#verificar_contrasenia'
end
