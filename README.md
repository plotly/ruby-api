###Ruby Wrapper to the PlotLy REST API

**Example Usage**

```ruby

plotly = PlotLy.new('username', 'api key')

args = [[0,1,2], [3,1,6]]

kwargs = {
  filename: 'plot from API',
  fileopt: 'overwrite',
  style: { type: 'bar' },
  traces: [0,3,5],
  layout: {
    title: 'Experimental Data'
  },
  world_readable: true
}

plotly.plot(args, kwargs) do |response|
  puts response['url']
end


```

###License

This library is licensed under the MPL.