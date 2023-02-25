#! /usr/bin/env fish

# secrets
source ~/.config/fish/secrets.fish

if status --is-interactive
  # allow git to prompt for passphrase (when expires)
  # export GPG_TTY=$(tty)

  # no need for a greeting
  set fish_greeting

  # use 1Password to authenticate `gh`
  source ~/.config/op/plugins.sh

  # source variables
  source ~/.config/fish/variables.fish

  # source git abbreviations
  source ~/.config/fish/abbr.fish

  # load zoxide (autojump alt)
  zoxide init fish | source

  # kitty completions
  # kitty + complete setup fish | source

  set -x TIME_STYLE long-iso

  set -x MANPAGER "nvim +Man!"

  # https://www.pgcli.com/pager
  set -x LESS "-XFR"

  set -x RIPGREP_CONFIG_PATH "$HOME/.config/ripgrep/ripgreprc"
  set -gx FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!doc/*"'

  set -gx GOPATH $HOME/go
  set -gx fish_user_paths $GOPATH/bin $fish_user_paths

  switch (uname)
  case Darwin
    # prefer homebrew installed ruby
    fish_add_path /opt/homebrew/opt/ruby/bin
    #             THIS IS SLOW!!! vvv
    # set -g fish_user_paths (gem env gemdir)/bin $fish_user_paths
    # use ruby version installed by homebrew
    set -g fish_user_paths "/opt/homebrew/lib/ruby/gems/3.2.0/bin" $fish_user_paths
    # rust/cargo
    set -g fish_user_paths "$HOME/.cargo/bin/" $fish_user_paths
    # c++ compatible version for neorg
    # set -g CC /usr/local/bin/gcc
  case Linux
    set -x GEM_HOME $HOME/.gem/
    # use ruby version installed by pacman
    # add home/bin to path
    set -g fish_user_paths \
      $HOME/.local/bin \
      $HOME/.gem/bin \
      $HOME/bin \
      $HOME/bin/workflow \
      $HOME/.node_modules/bin \
      $fish_user_paths

    # globally install node modules in $HOME directory
    set -x NPM_CONFIG_PREFIX $HOME/.node_modules
  end

  starship init fish | source

  # tea magic is causing conflict with rustup installed rust components (e.g. rustr-src)
  test -d "$HOME/.tea" && "$HOME/.tea/tea.xyz/v*/bin/tea" --magic=fish --silent | source
end
