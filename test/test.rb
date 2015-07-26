require 'test/unit'

$:.unshift File.join(File.dirname(__FILE__), "..", "lib")

require 'plotly'

class TestPlotLy < Test::Unit::TestCase
  
  def test_time_series

    plotly = PlotLy.new('louism', 'xatky2twxn')
    
    data = { 
      x: ['2013-10-04 22:23:00', '2013-11-04 22:23:00', '2013-12-04 22:23:00'],
      y: [1, 3, 6]
    }

    args = {
      filename: 'ruby_test_time_series',
      fileopt: 'overwrite',
      style: { type: 'scatter' },
      layout: {
        title: 'Ruby API Time Series Demo'
      },
      world_readable: true
    }

    plotly.plot(data, args) do |response|
      assert_response_ok(response, 'ruby_test_time_series')
    end
    
  end
  
  def test_bar_plot

    plotly = PlotLy.new('louism', 'xatky2twxn')
    
    data = [
      { x: ['giraffes', 'orangutans', 'monkeys'],
        y: [20, 14, 23]
      }, 
      { x: ['giraffes', 'orangutans', 'monkeys'],
        y: [12, 18, 29]
      }
    ]
    
    args = {
      filename: 'ruby_test_bar_plot',
      fileopt: 'overwrite',
      style: { type: 'bar', barmode: 'group' },
      layout: {
        title: 'Ruby API Bar Plot Demo'
      },
      world_readable: true
    }

    plotly.plot(data, args) do |response|
      assert_response_ok(response, 'ruby_test_bar_plot')
    end
    
  end
  
  def test_bar_plot_time_series

    plotly = PlotLy.new('louism', 'xatky2twxn')
    
    data = [
      { x: [1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012],
        y: [219, 146, 112, 127, 124, 180, 236, 207, 236, 263, 350, 430, 474, 526, 488, 537, 500, 439],
        name: 'Rest of world',
        marker: { color: 'rgb(55, 83, 109)' }
      },
      { x: [1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012],
        y: [16, 13, 10, 11, 28, 37, 43, 55, 56, 88, 105, 156, 270, 299, 340, 403, 549, 499],
        name: 'China',
        marker: { color: 'rgb(26, 118, 255)' }
      }
    ]
    
    args = {
      filename: 'ruby_test_bar_plot_time_series',
      fileopt: 'overwrite',
      style: { type: 'bar', barmode: 'group' },
      layout: {
        title: 'Ruby API Bar Plot Time Series Demo',
        xaxis: { tickfont: { size: 14, color: 'rgb(107, 107, 107)' } },
        yaxis: { title: 'USD (millions)',
                 titlefont: { size: 16, color: 'rgb(107, 107, 107)' },
                 tickfont: { size: 14, color: 'rgb(107, 107, 107)'} },
        legend: { x: 0, y: 1.0,
                  bgcolor: 'rgba(255, 255, 255, 0)',
                  bordercolor: 'rgba(255, 255, 255, 0)' },
        bargap: 0.15,
        bargroupgap: 0.1
      },
      world_readable: true
    }

    plotly.plot(data, args) do |response|
      assert_response_ok(response, 'ruby_test_bar_plot_time_series')
    end
    
  end
  
  def test_heat_map

    plotly = PlotLy.new('louism', 'xatky2twxn')
    
    data = { z: [[1, 20, 30], [20, 1, 60], [30, 60, 1]] }

    args = {
      filename: 'ruby_test_heat_map',
      fileopt: 'overwrite',
      style: { type: 'heatmap' },
      layout: {
        title: 'Ruby API Heat Map Demo'
      },
      world_readable: true
    }

    plotly.plot(data, args) do |response|
      assert_response_ok(response, 'ruby_test_heat_map')
    end
    
  end

  def assert_response_ok(response, filename)
    
    default_response = {
      "message"=>"",
      "warning"=>"",
      "filename"=>filename,
      "error"=>"" }
    
    response = response.dup
    response.delete('url')
    
    response_ok = response == default_response
    
    assert_equal response_ok, true
    
  end
  
end