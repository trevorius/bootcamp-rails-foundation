ActiveAdmin.register_page "Intervention Form" do
    content do

      $intervention = {}

      # get a list of customers for the first select field
      $customerList = []
      
       customers = Customer.all 
        # run through the customer list
        customers.count do |customer| 
            #  get pertinent information
            customerID = customer.id 
            customerName = customer.company_name 
            # create the text to be displayed in selection field
            customerdisplay = customerID.to_s + " -> " + customerName
            # element for the key, value pair in selector
            customerELE = [customerdisplay, customerID]
            # pp customerELE
            $customerList.push(customerELE)
        end
      # p"__________________________________"
      # pp @customerList
      # p"__________________________________"



      render partial: 'interventionform'
    end
  end