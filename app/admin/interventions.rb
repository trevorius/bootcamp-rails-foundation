ActiveAdmin.register Intervention do

    # See permitted parameters documentation:
    # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
    #
    # Uncomment all parameters which should be permitted for assignment
    #
    permit_params :author, :customer_id, :buidling_id, :battery_id, :column_id, :elevator_id, :employeeId, :start_date, :end_date, :result, :report, :status

    # permit_params :customer_id, :address_id, :address_of_the_building, :full_name_of_the_building_administrator, :email_of_the_administrator_of_the_building, :phone_number_of_the_building_administrator, :full_name_of_the_technical_contact_for_the_building, :technical_contact_email_for_the_building, :technical_contact_phone_for_the_building
    #
    # or
    #
    # permit_params do
    #   permitted = [:address_of_the_building, :full_name_of_the_building_administrator, :email_of_the_administrator_of_the_building, :phone_number_of_the_building_administrator, :full_name_of_the_technical_contact_for_the_building, :technical_contact_email_for_the_building, :technical_contact_phone_for_the_building]
    #   permitted << :other if params[:action] == 'create' && current_user.admin?
    #   permitted
    # end
    index do
        id_column
        # column :author
        column  :customer_id
        column  :buidling_id
        column  :battery_id
        column  :column_id
        column  :elevator_id
        column  :employee_id
        column  :start_date
        column  :end_date
        column  :result
        column  :report
        actions
    end
  
    filter :author
    filter :customer_id
    filter :buidling_id
    filter :employee_id
  
  end
  