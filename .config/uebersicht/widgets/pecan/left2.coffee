command: "bash -c '/usr/local/bin/chunkc tiling::query --desktop id'"

refreshFrequency: '1s'

render: (output) ->
  """
    <div class='screen'>
      <div class='left'>
        <span id="current_desktop">#{output}</span>
      </div>
      <div class='left2'>
        <ul>
          <li id="desktop_1" class="button" data-desktop="1">
            <i class="fal fa-compass" data-desktop="1"></i>
          </li>
          <li id="desktop_2" class="button" data-desktop="2">
            <i class="fab fa-slack-hash" data-desktop="2"></i>
          </li>
          <li id="desktop_3" class="button" data-desktop="3">
            <i class="fal fa-user-astronaut" data-desktop="3"></i>
          </li>
          <li id="desktop_4" class="button" data-desktop="4">
            <i class="fal fa-comment" data-desktop="4"></i>
          </li>
          <li id="desktop_5" class="button" data-desktop="5">
            <!-- browser icon looks more like a terminal to me :-/ -->
            <i class="fal fa-browser" data-desktop="5"></i>
          </li>
        </ul>
      </div>
    </div>
  """

style: """
  ul
    margin: 0 0 -10px 0
    padding: 0
  li
    display: inline-block
    font-size: 15px
    margin: 2px 2px 5px 2px
    padding: 0 0 2px 0
    text-align: center
  li.active
    border-bottom: 2px solid #c3c3c3
  i[class*="icon"]
    display: block
    height: 100%
    width: 100%
    margin: auto
"""

afterRender: (domEl) ->
  $(domEl).on 'click', ".button", (e) =>
    @switchDesktop($(e.target).data('desktop'));

switchDesktop: (target) ->
  @run("chunkc tiling::desktop --focus #{target}");

update: (output, domEl) ->
  current = output.toString().charAt(0);

  return if current == @previous;
  domEl = $(domEl)

  domEl.find('#current_desktop').text(output);

  @resetIcon(i, domEl) for i in [1, 3, 4, 5];

  domEl.find("#desktop_#{current}").addClass('active');

  @swapClass(domEl, 2, 'fa-slack', 'fa-slack-hash');
  domEl.find("#desktop_2").removeClass('active')

  if (output.toString().charAt(0) == "2")
    @swapClass(domEl, 2, 'fa-slack-hash', 'fa-slack');
    domEl.find("#desktop_2").addClass('active')
  else
    @swapClass(domEl, output, 'fal', 'fas')

  @previous = current

resetIcon: (number, domEl) ->
  domEl.find("#desktop_#{number}").removeClass('active')
  @swapClass(domEl, number, 'fas', 'fal')

swapClass: (domEl, number, remove, add) ->
  domEl.find("#desktop_#{number} > i").removeClass(remove).addClass(add);
