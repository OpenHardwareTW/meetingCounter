MockRespuesta::Application.routes.draw do
  post "contador/personas/:estado" => "api#contarPersonas" 
  post "contador/reset" => "api#reiniciarContador"
end