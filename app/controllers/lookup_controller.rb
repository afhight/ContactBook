class LookupController < ApplicationController
  def search
  end

  def results
  	if params[:name] != nil
  		name_arr = params[:name].titleize.split
  		@results = Contact.where(first_name: name_arr[0], last_name: name_arr[1], user_id: current_user.id)
  	elsif params[:city] != nil
  		@results = Contact.where(city: params[:city].titleize, user_id: current_user.id)
    elsif params[:business_name] != nil
      @results = Contact.where(business_name: params[:business_name].titleize, user_id: current_user.id)
  	end
  end
end
