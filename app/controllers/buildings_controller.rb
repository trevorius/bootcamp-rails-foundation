class BuildingsController < InheritedResources::Base

  # @buildings = Building.accessible_by(current_ability)
  
  
  def buildingselection
    if params[:customer].present?
      @buildings = Customer.find(params[:customer]).buildings
    else 
      @buildings = {}
    end
    if request.xhr?
      respond_to do |format|
        format.json{
          render json: {buildings: @buildings}
        }
      end
    end
  end

  private
  def building_params
    params.require(:building).permit(:address_of_the_building, :full_name_of_the_building_administrator, :email_of_the_administrator_of_the_building, :phone_number_of_the_building_administrator, :full_name_of_the_technical_contact_for_the_building, :technical_contact_email_for_the_building, :technical_contact_phone_for_the_building)
  end

  
end
