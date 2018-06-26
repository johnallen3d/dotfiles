command: "sh ./pecan/scripts/mpd"

refreshFrequency: '1s'

render: (output) ->
  """
    <div class="screen">
      <div class="holder">
        <div id="mpd" class="mpd center">
          <i class="fas fa-headphones"></i>
          <span id="notEmpty">
            <span id="trackCount"></span>
            <span id="artist"></span>
            <span> - </span>
            <span id="song"></span>
            <span> | </span>
            <span id="elapsed"></span>
            <span> | </span>
            <i id="backward" class="fas fa-backward control"></i>&nbsp;
            <i id="pause" class="fas fa-pause control"></i><i id="play" class="fas fa-play control"></i>&nbsp;
            <i id="forward" class="fas fa-forward control"></i>
            <span> | </span>
            <i class="fas fa-volume-up control"></i>
            <spand id="volume"></span>
          </span>
        </div>
      </div>
    </div>
  """

style: """
  height: 12px;
  bottom: 18px;

  .center
    width: 700px;
  .fa-circle
    font-size: 0.6em;
  .control
    font-size: 0.7em;
    cursor: pointer;
"""

update: (output, domEl) ->
  details = JSON.parse(output);
  isEmpty = details.status == "[empty]"
  root = $(domEl)

  root.find('#notEmpty').toggle(!isEmpty)

  @priorDetails = details

  if isEmpty == true
    root.find('#mpd').css('width', '12px');
    return

  root.find('#mpd').css('width', '700px');

  trackCount = "(#{details.currentTrackNumber} of #{details.totalTrackCount})"

  root.find('#trackCount').text(trackCount)
  root.find('#artist').text(details.artist)
  root.find('#song').text(details.song)
  root.find('#elapsed').text("#{details.currentTime} - #{details.trackLength}")
  root.find('#volume').text(details.volume)

  root.find('#play').toggle(details.status == "[paused]")
  root.find('#pause').toggle(details.status == "[playing]")

afterRender: (domEl) ->
  root = $(domEl)
  root.find(".fa-pause").on    "click", => @run "/usr/local/bin/mpc pause"
  root.find(".fa-play").on     "click", => @run "/usr/local/bin/mpc play"
  root.find(".fa-forward").on  "click", => @run "/usr/local/bin/mpc next"
  root.find(".fa-backward").on "click", => @run "/usr/local/bin/mpc prev"
