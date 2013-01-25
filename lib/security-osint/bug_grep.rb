require 'rss-motor'

RSS_LIST = File.expand_path(File.join File.dirname(__FILE__), '..', '..', 'resources/rss.lst')
APP_LIST = File.expand_path(File.join File.dirname(__FILE__), '..', '..', 'resources/app.lst')

module Security
  module Osint
    module BugGrep

      def self.rss_linkz
        IO.readlines(RSS_LIST)
      end
      def self.reqd_appz
        IO.readlines(APP_LIST)
      end

      def self.bug_alarm_generator(title,links,descr)
        puts "~" * 25
        puts "grepped for keyword: [ " + @curr_app + " ]\n"
        print "#{title.gsub(/\s+/,' ').strip()}\n"
        print "link: #{links.strip()}\n" 
        if descr==nil or descr.strip()=="" then
          print "\n"
        else
          print "detail:\n #{descr.strip()}\n\n"
        end
        puts "[ Courtesy:" + @curr_lnk + " ]"
      end

      def self.grep
        rss_linkz.each do |lnk|
          rss = Rss::Motor.rss_items lnk.strip
          rss.each do |i,j|
            puts i,j
          end
          reqd_appz.collect{|app| app.strip }
          puts "~" * 25 
        end
      end
    end
  end
end
