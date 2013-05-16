post '/urls' do
  # create a new Url
end

get '/:short_url' do
  @url = Url.find_by_short_url(params[:short_url])
  @url.increment
  redirect to "http://#{@url.long_url}"
end

post '/shorten' do
 @url = Url.new(:short_url => SecureRandom.hex(3), :user_id => current_user.id, :long_url => params[:url].gsub(/^http:\/\//,''))
 @url.save 
  if @url.save
    erb :shorten
  else 
    @errors = @url.errors
    erb :index
  end
end 
