module Formatters
  class PrintFormatter
    def initialize(tramtracker)
      @tramtracker = tramtracker
    end

    def report
      puts Time.now
      puts "Retrieving information for stop id: #{@tramtracker.stop_id}"
      @tramtracker.get.each do |tram|
        printf "Route %3s arriving in %2s minutes\n",
          tram[:route],
          tram[:minutes]
      end
    end
  end
end
