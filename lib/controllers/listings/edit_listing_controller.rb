#
class Oodls < Sinatra::Base

  get '/listings/edit/:id' do
    @listing = Listing.get(params[:id])
    erb :'listings/listing_edit' if @listing.user_id == current_user.id
  end

  post '/listings/edit/:id' do
    altered_listing = Listing.get(params[:id])
    altered_listing.update(donation_centre_address: update_model(:donation_centre_address, altered_listing),
                           donation_centre_postcode: update_model(:donation_centre_postcode, altered_listing),
                           weekday_opening_hours: update_model(:weekday_opening_hours, altered_listing),
                           weekend_opening_hours: update_model(:weekend_opening_hours, altered_listing))
    flash[:notice] = 'Your listing has been updated'
    redirect '/charity/home'
  end

  get '/listings/delete/:id' do
    unwanted_listing = Listing.get(params[:id])
    unwanted_listing.destroy
    flash[:notice] = 'Your listing has been deleted'
    redirect '/charity/home'
  end

end
