class Monitor::WebsiteLoop < Loops::Base
  def run
    
    check_time = @config[:check_time].to_i || 30
    
    sites = Website.enabled.where(:updated_at.lte => check_time.seconds.ago)
    
    pending = sites.length
    return if pending == 0
    
    EM::run do
      sites.each do |site|
        # info 
        site.touch
        http = EM::HttpRequest.new(site.url).get :timeout => site.ttl, :redirects => 3
        http.callback do
          logger.info "Checked site: #{site.name}"

          code = http.response_header.status
          response = site.responses.create! :code => code

          unless response.is_good?
            logger.warn "HTTP code isn't right (#{code})! Site: #{site.name}"
          end
          
          pending -= 1
          EM.stop if pending < 1
        end
        
        http.errback do
          logger.error "Check FAILED! Site: #{site.name}"
          
          site.responses.create! :timed_out => true
          
          pending -= 1
          EM.stop if pending < 1
        end
      
      end
    end
    
  end
end