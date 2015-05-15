require("bundler/setup")
Bundler.require(:default, :production)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @bands = Band.all()
  @venues = Venue.all()
  erb(:index)
end

get('/bands/new') do
  erb(:band_form)
end

post('/bands') do
  name = params.fetch('name')
  @new_band = Band.new({:description => name})
  if @new_band.save()
    redirect to("/bands/#{@new_band.id}")
  else
    @bands = Band.all()
    erb(:index)
  end
end

get('/bands/:id') do
  @band = Band.find(params.fetch("id").to_i())
  @venues = Venue.all()
  @bands_venues = @band.venues()
  erb(:band)
end

get('/bands/:id/edit') do
  @band = Band.find(params.fetch("id").to_i())
  @venues = Venue.all()
  @bands_venues = @band.venues()
  erb(:band_edit)
end

patch('/bands/:id') do
  @band = Band.find(params.fetch("id").to_i())
  description = params.fetch("description")
  @band.update({:description => description})
  @venues = @band.venues()
  if @band.save()
    redirect to("/bands/#{@band.id}/edit")
  else
    erb(:error)
  end
end

delete("/bands/:id") do
  band = Band.find(params.fetch("id").to_i())
  band.delete()
  erb(:cancel_contract)
end
