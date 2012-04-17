module Neography
  class HTTPClient
    
    def get(url,options={})
      res = HTTParty.get(url, options)
      JSONResponse.new(res.code, res.body, res.parsed_response)
    end

    def post(url,options={})
      res = HTTParty.post(url, options)
      JSONResponse.new(res.code, res.body, res.parsed_response)       
    end

    def put(url,options={})
      res = HTTParty.put(url, options)
      JSONResponse.new(res.code, res.body, res.parsed_response)       
    end

    def delete(url,options={})
      res = HTTParty.delete(url, options)
      JSONResponse.new(res.code, res.body, res.parsed_response)       
    end
  end
  
  class JSONResponse
    
    attr_reader :code, :body, :parsed_response
    
    def initialize(code, body, parsed_response = nil)
      @code, @body, @parsed_response = code, body, parsed_response
      
      if @parsed_response.nil?
        begin
          @parsed_response = JSON.parse(@body)
        rescue
        end
      end
    end
    
  end
end

