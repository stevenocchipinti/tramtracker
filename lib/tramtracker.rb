require 'open-uri'

class Tramtracker
  def initialize(stop_id)
    @url = "http://www.tramtracker.com.au/?id=#{stop_id}"
  end

  def get
    regex = /\d*\) Rte (\d*)<br>\r\n(\d*)/
    open(@url).read.scan(regex).collect do |route, minutes|
      {
        route: route,
        minutes: minutes
      }
    end
  end
end
