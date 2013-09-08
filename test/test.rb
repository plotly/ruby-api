require 'test/unit'

$:.unshift File.join(File.dirname(__FILE__), "..", "lib")

require 'plotly'

class TestPlotLy < Test::Unit::TestCase

  def test_plotly

    plotly = PlotLy.new('louism', 'xatky2twxn')

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
      assert_equal response['url'], 'https://plot.ly/~louism/0'
      assert_equal response['error'], ''
    end
    
  end
  
end