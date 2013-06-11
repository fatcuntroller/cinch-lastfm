require 'cinch'
require 'nokogiri'
require 'open-uri'
require 'redis'
require 'redis-namespace'

module Cinch
	module Plugins
		class Lastfm
			include Cinch::Plugin
			attr_accessor :backend, :redis
			# Redis backend

			class << self
				attr_accessor :lfmapi, :host, :port # Redis backend scrub

				def configure(&block) 
					yield self
				end
			end

			def initialize(*args)
				super
				@redis = Redis.new(:host => self.class.host, :port => self.class.port, :thread_safe => true)
				@backend = Redis::Namespace.new("cinch-lastfm", :redis => redis)
				# Redis backend
			end

			match %r{np ([a-zA-Z0-9]+)}, :method => :now_playing
			match %r{link ([a-zA-Z0-9]+)}, :method => :link_account
			match %r{np$}, :method => :now_playing_user


			# Gets Now Playing for an user
			def now_playing(m, nick)
				artist, track = get_data(nick)
				m.reply("#{nick} has recently played: #{artist} - #{track}")
			end

			# Gets Now Playing for a linked account
			def now_playing_user(m)
				nick = @backend.get(m.user)
				if nick
					artist, track = get_data(nick)
					m.reply("#{nick} has recently played: #{artist} - #{track}")
				end
			end

			# Links a designated Last Fm account
			def link_account(m, nick)
				@backend.set(m.user, nick)
				m.reply("#{m.user} is now linked with account #{nick}!")
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