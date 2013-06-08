module Formatters
  class PollingFormatter

    KILL_LINE_CHAR = "\x1B[K"
    CURSOR_UP_CHAR = "\x1B[A"

    def initialize(tramtracker)
      @tramtracker = tramtracker
      @delay_interval = 15
      @max_iterations = 60
    end

    def report
      puts Time.now.strftime "[%H:%M:%S] Stop #{@tramtracker.stop_id}"
      puts "Retrieving tram information..."
      last_results_count = 0
      @max_iterations.times do |iteration|
        results = @tramtracker.get
        clear(last_results_count + 2)
        last_results_count = results.count
        puts Time.now.strftime "[%H:%M:%S] Stop #{@tramtracker.stop_id}"
        results.each do |tram|
          printf "Route %3s arriving in %2s minutes\n",
            tram[:route],
            tram[:minutes]
        end
        delay @delay_interval
      end
    end

    private

    def delay(seconds)
      seconds.times do |i|
        print "\rRetrieving again in #{seconds-i} seconds..."
        sleep 1
      end
      print "\r#{KILL_LINE_CHAR}Retrieving again NOW...\n"
    end

    def clear(lines)
      lines.times { print "#{CURSOR_UP_CHAR}#{KILL_LINE_CHAR}" }
    end

  end
end
