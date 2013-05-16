# SecureRandom was required in config/database so we don't have to require it here

get '/' do
  # Look in app/views/index.erb
  erb :index
end





