class Oodls < Sinatra::Base

  get '/listings/new' do
    erb :'listings/new_listing_form'
  end

  post '/listings' do
    @user = current_user
    listing = Listing.create(:donation_centre_address => params[:address],
  						               :donation_centre_postcode => params[:postcode],
  							             :weekday_opening_hours => params[:weekday_hours],
  							             :weekend_opening_hours => params[:weekend_hours],
                             :user_id => @user.id)
    redirect '/charity/home'
  end

  get '/listings/all' do
    @listings = Listing.all
    erb :'listings/list_all_charities'
  end

  get '/listings/edit/:id' do
    @listing = Listing.get(params[:id])
    if @listing.user_id == current_user.id
      erb :'listings/listing_edit'
    end #this currently throws a massive error when the above condition is not met. which i'm okay with for now, but I would like to find a better way.
  end

  post '/listings/edit/:id' do
    altered_listing = Listing.get(params[:id])
    altered_listing.update(:donation_centre_address => update_model(:donation_centre_address, altered_listing),
                           :donation_centre_postcode => update_model(:donation_centre_postcode, altered_listing),
                           :weekday_opening_hours => update_model(:weekday_opening_hours, altered_listing),
                           :weekend_opening_hours => update_model(:weekend_opening_hours, altered_listing))
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