require 'open-uri'

class Tramtracker
  attr_accessor :stop_id

  def initialize(stop_id)
    @stop_id = stop_id
  end

  def get
    regex = /\d*\) Rte (\d*)<br>\r\n(\d*)/
    open(url).read.scan(regex).collect do |route, minutes|
      {
        route: route,
        minutes: minutes
      }
    end
  end

  private

  def url
    "http://www.tramtracker.com.au/?id=#{@stop_id}"
  end

end
