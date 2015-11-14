require 'yaml'

module Login

  def self.loginsettings
    return @loginsettings if @loginsettings

     path = "config/settings.yml"

    @loginsettings = LoginHelper.new path
  end

  class LoginHelper

    attr_reader :username
    attr_reader :password


   def initialize path
    settings = YAML.load_file(path)
    @username = settings["email"]
    @password = settings["password"]
   end

  end

end

