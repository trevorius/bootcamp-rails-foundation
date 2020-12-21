require "ibm_watson/authenticators"
require "ibm_watson/text_to_speech_v1"
include IBMWatson

ActiveAdmin.register_page "Map" do

  def index
  end

  
  content do

    total_elev = Elevator.all.count
    total_elevators = ""
    if total_elev > 1000
      total_elevators = " #{(total_elev /1000 )} thousand #{total_elev % 1000}"
    else 
      total_elevators = total_elev.to_s
    end
    puts "________________________________________________________________________________________________________"
    puts "elevators : "+ total_elevators.to_s
    puts "________________________________________________________________________________________________________"

    total_buildings = Building.all.count
    puts "________________________________________________________________________________________________________"
    puts "buildings : "+ total_buildings.to_s
    puts "________________________________________________________________________________________________________"

    total_clients = Customer.all.count
    puts "________________________________________________________________________________________________________"
    puts "client : "+ total_clients.to_s
    puts "________________________________________________________________________________________________________"

    not_running_servicing_elevators = Elevator.count - Elevator.where(status: 'Active').count
    not_running_servicing_elevators_string = ""
    if not_running_servicing_elevators > 1000
      not_running_servicing_elevators_string = " #{(not_running_servicing_elevators /1000 )} thousand #{not_running_servicing_elevators % 1000}"
    else  
      not_running_servicing_elevators_string = not_running_servicing_elevators.to_s
    end
    puts "________________________________________________________________________________________________________"
    puts "inactive elevators and in intervention : "+ not_running_servicing_elevators.to_s
    puts "________________________________________________________________________________________________________"

    number_of_quotes = Quote.all.count
    puts "________________________________________________________________________________________________________"
    puts "QUOTES : "+ number_of_quotes.to_s
    puts "________________________________________________________________________________________________________"

    number_of_leads = Lead.all.count
    puts "________________________________________________________________________________________________________"
    puts "Leads : "+ number_of_leads.to_s
    puts "________________________________________________________________________________________________________"

    total_batteries = Battery.all.count
    puts "________________________________________________________________________________________________________"
    puts "batteries : "+ total_batteries.to_s
    puts "________________________________________________________________________________________________________"

    total_cities = Address.where(id: Building.select(:address_id).distinct).select(:city).distinct.count
    puts "________________________________________________________________________________________________________"
    puts "cities : "+ total_cities.to_s
    puts "________________________________________________________________________________________________________"

    logged_user = Employee.where(admin_user_id: current_admin_user.id).take[:first_name] +" "+ Employee.where(admin_user_id: current_admin_user.id).take[:last_name] 
    puts "________________________________________________________________________________________________________"
    puts "User : "+ logged_user.to_s
    puts "________________________________________________________________________________________________________"

    text_for_Watson = "Hello #{logged_user}, there are currently #{total_elevators} elevators deployed in the #{total_buildings} buildings of your #{total_clients} customers. Currently, #{not_running_servicing_elevators_string} elevators are not in Running status and are being serviced. You currently have #{number_of_quotes} quotes awaiting processing. You currently have #{number_of_leads} leads in your contact requests. And #{total_batteries} batteries are deployed across #{total_cities} cities"
    puts "________________________________________________________________________________________________________"
    puts text_for_Watson
    puts "________________________________________________________________________________________________________"

    # # COMMENT IN AND OUT FOR WATSON TO WORK
    # authenticator = Authenticators::IamAuthenticator.new(
    # apikey: ENV['ibm_watson_key']
    # )

    # text_to_speech = TextToSpeechV1.new(
    # authenticator: authenticator
    # )
    # text_to_speech.service_url = ENV['ibm_watson_url']

    # File.open("app/assets/audio/first.wav", "wb") do |audio_file|
    # response = text_to_speech.synthesize(
    #     text: text_for_Watson,
    #     accept: "audio/wav",
    #     voice: "en-US_AllisonV3Voice"
    # )
    # audio_file.write(response.result)
    # end

    render partial: 'map'

  end
end
