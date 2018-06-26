command: "bash Pecan/scripts/stats"

refreshFrequency: '5s'

render: (output) ->
  """
    <div class='screen'>
      <div class='right2'>
        <span id="battery_icon"></span>
        <span id="battery_percentage"></span>
        <span id="charging_status"></span>
        |
        <i class="fal fa-microchip"></i>
        <span id="cpu_percentage"></span>
        |
        <i class="fal fa-memory"></i>
        <span id="memory_percentage"></span>
        |
        <span id="volume_icon"></span>
        <span id="volume_percentage"></span>
      </div>
    </div>
  """

update: (output, domEl) ->
  root = $(domEl)
  details = JSON.parse(output)

  root.find('#battery_icon').html(@batteryIcon(details))
  root.find('#battery_percentage').text(@percentage(details.batteryPercentage))
  root.find('#charging_status').html(@chargingStatus(details))
  root.find('#cpu_percentage').text(@cpuFormatted(details))
  root.find('#memory_percentage').text(@percentage(details.memoryPercentage))
  root.find('#volume_icon').html(@volumeIcon(details))
  root.find('#volume_percentage').text(@volumeFormatted(details))

percentage: (value, length = 2) ->
  number = parseInt(value)

  if number == 100
    "100%"
  else
    "0#{number}".slice(-1 * length) + '%'

batteryIcon: (details) ->
  percentage = parseInt(details.batteryPercentage)
  color = ''

  if percentage >= 95
    status = 'full'
  else if percentage >= 65 and percentage < 95
    status = 'three-quarters'
  else if percentage < 65 and percentage >= 40
    status = 'half'
  else if percentage < 40 and percentage >= 15
    status = 'quarter'
  else if percentage < 15 and percentage >= 5
    color = '#FFA500'
    status = 'empty'
  else if percentage < 5
    color = 'red'
    status = 'slash'

  icon = "<i class='fal fa-battery-#{status}'></i>"

  if color != ''
    icon = "<span style=\"color:#{color}\">#{icon}</span>"

  icon

chargingStatus: (details) ->
  if details.chargingStatus != "Ba"
    "<i class='fal fa-bolt'></i>"
  else
    ""

cpuFormatted: (details) ->
  # 8 cores
  @percentage(details.cpuPercentage / 8)

volumeIcon: (details) ->
  volume = parseInt(details.volumePercentage)
  icon = ''

  if details.mutedStatus == "true"
    icon = 'mute'
  else if volume > 50
    icon = 'up'
  else if volume > 20
    icon = 'down'
  else
    icon = 'off'

  "<i class='fal fa-volume-#{icon}'></i>"

volumeFormatted: (details) ->
  if details.mutedStatus == "true"
    '00%'
  else
    @percentage(details.volumePercentage)
