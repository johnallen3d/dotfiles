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
    fish_add_path "/usr/local/bin"
    fish_add_path "$HOME/bin"
    fish_add_path "$HOME/.bin"
    fish_add_path "$HOME/.local/bin"
    # prefer homebrew installed ruby
    fish_add_path "/opt/homebrew/opt/ruby/bin"
    # use ruby version installed by homebrew
    fish_add_path "/opt/homebrew/lib/ruby/gems/3.2.0/bin"
    # rust/cargo
    fish_add_path "$HOME/.cargo/bin"
    # c++ compatible version for neorg
    # set -g CC /usr/local/bin/gcc
  case Linux
    fish_add_path $HOME/.local/bin
    fish_add_path $HOME/.gem/bin
    fish_add_path $HOME/bin
    fish_add_path $HOME/.node_modules/bin \

    # globally install node modules in $HOME directory
    set -x NPM_CONFIG_PREFIX $HOME/.node_modules
    set -x GEM_HOME $HOME/.gem/
  end

  starship init fish | source

  test -d "$HOME/.tea" && "$HOME/.tea/tea.xyz/v*/bin/tea" --magic=fish --silent | source
end
