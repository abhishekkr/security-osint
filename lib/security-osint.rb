# security-osint : OSINT For Security

puppeteer_libs = File.join(File.dirname(File.expand_path __FILE__), 'security-osint', '*.rb')
Dir.glob(puppeteer_libs).each do |lib|
  require lib
end

module Security
  module Osint

    def self.exploits
      Security::Osint::BugGrep.grep
    end
  end
end
