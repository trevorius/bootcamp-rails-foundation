require './lib/elevator_media_display/elevator_media.rb'

class MediaStreamer < ActiveRecord::Base
    include ElevatorMedia 
end