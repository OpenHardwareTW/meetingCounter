MockRespuesta::Application.routes.draw do
  get 'paises/:id' => 'api#obtener_pais_con_id'
end
