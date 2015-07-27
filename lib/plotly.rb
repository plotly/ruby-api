class PlotLy
  
  require 'net/http'
  require 'json'
  
  VERSION = '0.0.1'
  
  PlotLyUri = URI.parse('https://plot.ly')
  PlotLyApiVersion = '0.1'
  
  PlotLyOrigins = [:plot, :style, :layout]
  
  def initialize(username, api_key, version = nil)
    
    @username, @api_key = username, api_key
    @version ||= PlotLyApiVersion
    
    @plotter = Net::HTTP.new(PlotLyUri.host, PlotLyUri.port)
    @plotter.use_ssl = true
    
  end
  
  def method_missing(sym, *args, &block)
    
    raise NoMethodError if !PlotLyOrigins.include?(sym)
    
    post(sym, args[0] || [], args[1] || {}, &block)
    
  end
  
  private
  
  def post(origin, args, kwargs, &block)
    
    request = Net::HTTP::Post.new('/clientresp')
    
    data = {
      un: @username,
      key: @api_key,
      origin: origin.to_s,
      platform: 'Ruby',
      args: args.to_json,
      kwargs: kwargs.to_json
    }
    
    request.body = URI.encode_www_form(data)
    response = @plotter.request(request)
    
    yield JSON.parse(response.body)

  end
  

end