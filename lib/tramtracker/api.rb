require 'open-uri'
require 'json'
require 'date'

module Tramtracker
  class API
    DATE_FORMAT = "/Date(%Q%z)/"
    attr_accessor :stop_id

    def initialize(stop_id)
      @stop_id = stop_id
    end

    def get
      api_response["responseObject"].collect do |tram|
        {
          route: tram["RouteNo"],
          minutes: minutes_until(tram["PredictedArrivalDateTime"])
        }
      end
    end


    private

    def api_url
      "http://www.tramtracker.com.au/Controllers/GetNextPredictionsForStop.ashx?stopNo=#{@stop_id}&routeNo=0&isLowFloor=false"
    end

    def api_response
      JSON.parse(open(api_url).read).tap do |response|
        @request_time = DateTime.strptime(response["timeResponded"], DATE_FORMAT)
      end
    end

    def minutes_until(timestamp)
      arrival_time = DateTime.strptime(timestamp, DATE_FORMAT)
      ((arrival_time - @request_time) * 24 * 60).to_i
    end

  end
end
