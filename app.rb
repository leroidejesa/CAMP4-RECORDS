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
    erb(:error)
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

get('/venues/new') do
  @venues = Venue.all()
  erb(:venue_form)
end

post('/venues') do
  name = params.fetch('name')
  @new_venue = Venue.new({:description => name})
  if @new_venue.save()
    redirect to("/venues/new")
  else
    erb(:error)
  end
end

get('/bands/:id/edit/venue') do
  band_id = params.fetch("id").to_i()
  @band = Band.find(band_id)
  @venues = Venue.all()
  erb(:venue_update)
end

patch("/band/venues/:id") do
  band_id = params.fetch("id").to_i()
  @band = Band.find(band_id)
  venue_ids = params.fetch("venue_ids")
  @venues = Venue.all()
  @band.update({:venue_ids => venue_ids})
  redirect to("/bands/#{band_id}/edit")
end
