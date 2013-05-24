require 'cinch'
require 'nokogiri'
require 'open-uri'

module Cinch
	module Plugins
		class Lastfm
			include Cinch::Plugin
			#attr_accessor :backend
			# Redis backend

			class << self
				attr_accessor :lfmapi #:host, :port # Redis backend scrub

				def configure(&block) 
					yield self
				end
			end

			def initialize(*args)
				super
				# @backend = Redis.new(self.class.host, self.class.port)
				# Will feature a redis backend
			end

			match %r{np ([a-zA-Z]+)}, :method => :now_playing

			# Gets Now Playing for an user
			def now_playing(m, nick)
				artist, track = get_data(nick)
				m.reply("#{nick} has recently played: #{artist} - #{track}")
			end

			def get_data(nick)
				lfmXML = Nokogiri::XML(open("http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user=#{nick}&api_key=#{self.class.lfmapi}"))
				artist = lfmXML.xpath('//artist').first.content
				track = lfmXML.xpath('//name').first.content
				[artist, track]
			end
		end #Lastfm
	end #Plugins
end #Cinch