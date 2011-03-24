# encoding: utf-8
module Mail
  module VERSION

    version = {}
    File.read(File.join(File.dirname(__FILE__), '../', 'VERSION')).each_line do |line|
      type, value = line.chomp.split(":")
      next if type =~ /^\s+$/  || value =~ /^\s+$/
      version[type] = value
    end

    begin
      old_verbose = $VERBOSE
      $VERBOSE = nil

      MAJOR = version['major']
      MINOR = version['minor']
      PATCH = version['patch']
      BUILD = version['build']

      STRING = [MAJOR, MINOR, PATCH, BUILD].compact.join('.')
    ensure
      $VERBOSE = old_verbose
    end

    def self.version
      STRING
    end

  end
end

