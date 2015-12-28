class Dashing.PolarChart extends Dashing.Widget

  ready: ->
    @ctx = $(@node).find('.chart-area')[0].getContext('2d')
    @myData = @get('segments')

    @myChart = new Chart(@ctx).PolarArea(@myData, $.extend({
      responsive: true
      segmentShowStroke: true
    }, @get('options')))

  onData: (data) ->
    # Load new values, ie,
    #   @myChart.segments[0].value = data.segments[0].value
    #   @myChart.segments[1].value = data.segments[1].value
    #   ...
    if @myChart && data.segments
      for i in [0..@myChart.segments.length - 1]
        @myChart.segments[i].value = data.segments[i].value

      @myChart.update()
