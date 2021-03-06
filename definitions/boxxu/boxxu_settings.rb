require 'YAML'
require 'singleton'

module BoxxuSettings


  class SettingsFile
    include Singleton

    SETTINGS_DIR  = ".boxxu"
    SETTINGS_FILE = "boxxu.yml"
    DEFAULTS      = { :locale => "en_US.UTF-8", 
                      :keyboard_layout_code => "us",
                      :timezone => "UTC",
                      :host_addr => "192.168.100.2",
                      :boxxu_user => "boxxu_user",
                      :boxxu_pw => "boxxu_user"

                    }

    def initialize

      @user                      = ENV['USERNAME'] || ENV['USER']
      @home                      = Dir.home

      # Settings in user home directory
      @user_settings_file        = File.join(@home, SETTINGS_DIR, SETTINGS_FILE)
      # Settings in current directory
      @current_dir_settings_file = File.join(File.dirname(__FILE__), SETTINGS_FILE)
      # Settings in directory given by environment variable
      @env_settings_file = File.join(ENV['BOXXU_CFG_DIR'], SETTINGS_FILE) unless ENV['BOXXU_CFG_DIR'].nil?

      # Prio: 1) Environment override, 2) User home dir, 3) Current dir
      @settings_file = if not @env_settings_file.nil? and File.exist?(@env_settings_file)
                         @env_settings_file
                       elsif File.exist?(@user_settings_file)
                         @user_settings_file
                       elsif File.exist?(@current_dir_settings_file)
                         @current_dir_settings_file
                       else
                         nil
                       end

      @settings = YAML.load_file(@settings_file) unless @settings_file.nil?


    end


    def read_setting(name, default)

      case @settings
        when nil
          default
        else
          @settings[name.to_s] || default
      end

    end


    def get_value(name)

      case name
        when :locale
          read_setting( :locale, ENV['LANG'] || DEFAULTS[:locale])
        when :keyboard_layout_code
          read_setting( :keyboard_layout_code, DEFAULTS[:keyboard_layout_code])
        when :timezone
          read_setting( :timezone, ENV['TZ'] || DEFAULTS[:timezone])
        when :host_addr
          read_setting( :host_addr, DEFAULTS[:host_addr])
        when :boxxu_user
          read_setting( :boxxu_user, ENV['USER'] || DEFAULTS[:boxxu_user])
        when :boxxu_pw
          read_setting( :boxxu_pw, ENV['USER'] || DEFAULTS[:boxxu_pw])
        else
          ""
      end

    end

  end

  # ---

  def BoxxuSettings.locale()
    BoxxuSettings::SettingsFile.instance.get_value(:locale)
  end

  def BoxxuSettings.keyboard_layout_code()
    BoxxuSettings::SettingsFile.instance.get_value(:keyboard_layout_code)
  end

  def BoxxuSettings.timezone()
    BoxxuSettings::SettingsFile.instance.get_value(:timezone)
  end

  def BoxxuSettings.host_addr()
    BoxxuSettings::SettingsFile.instance.get_value(:host_addr)
  end

  def BoxxuSettings.boxxu_user()
    BoxxuSettings::SettingsFile.instance.get_value(:boxxu_user)
  end

  def BoxxuSettings.boxxu_pw()
    BoxxuSettings::SettingsFile.instance.get_value(:boxxu_pw)
  end

end
