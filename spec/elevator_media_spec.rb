require 'elevator_media_display/elevator_media'

describe ElevatorMedia::Streamer do
    describe ".getContent" do
        context "on run " do
            it "returns a string" do
                expect(ElevatorMedia::Streamer.getContent()).to be_a(String)
            end
        end
    end
end