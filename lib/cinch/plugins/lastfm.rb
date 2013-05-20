require 'cinch'
require 'lastfm'

module Cinch
	module Plugins
		module Lastfm
			class Base
				include Cinch::Plugin
				#attr_accessor :backend
				# Redis backend

				class << self
					attr_accessor :lfmapi, :lfmsecret, #:host, :port # Redis backend scrub

					def configure(&block) 
						yield self
					end
				end

				def initialize(*args)
					super
					#@backend = Redis.new(self.class.host, self.class.port)
					# Will feature a redis backend
				end

				match %r{np (.+?)}, :method => :now_playing

				# Gets Now Playing for an user
				def now_playing(m, nick)

				end
			end #Base
		end #Lastfm
	end #Plugins
end #Cinch