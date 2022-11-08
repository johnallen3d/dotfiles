# ruby 1.8.7 compatible
require 'rubygems'
require 'irb/completion'
require 'irb/ext/save-history'

# irb configuration
IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:AUTO_INDENT] = true

# irb history
IRB.conf[:EVAL_HISTORY] = 10
IRB.conf[:SAVE_HISTORY] = 1000
# IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

class Object
  def interesting_methods
    case self.class
    when Class
      self.public_methods.sort - Object.public_methods
    when Module
      self.public_methods.sort - Module.public_methods
    else
      self.public_methods.sort - Object.new.public_methods
    end
  end
end

# list methods which aren't in superclass
def local_methods(obj = self)
  (obj.methods - obj.class.superclass.instance_methods).sort
end

# Load a local irbrc
# http://www.samuelmullen.com/2010/04/irb-global-local-irbrc/
def load_irbrc(path)
  return if (path == ENV["HOME"]) || (path == '/')

  load_irbrc(File.dirname path)

  irbrc = File.join(path, ".irbrc")

  load irbrc if File.exists?(irbrc)
end

# load .railsrc in rails environments
railsrc_path = File.expand_path('~/.irbrc_rails')
if ( ENV['RAILS_ENV'] || defined? Rails ) && File.exist?( railsrc_path )
  begin
    load railsrc_path
  rescue Exception
    warn "Could not load: #{ railsrc_path } because of #{$!.message}"
  end
end
