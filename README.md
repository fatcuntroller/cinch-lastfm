# Cinch-Lastfm

This is the Cinch Last.fm plugin adding "recently played" functionality.

## Getting Started

This section is yet to be done, and will be done as this becomes a gem.

	Cinch::Plugins::Lastfm.configure do |c|
		c.lfmapi = "yourlastfmapikey"
	end

	bot = Cinch::Bot.new do
		configure do |c|
			c.plugins.plugins = [Cinch::Plugins::Lastfm]
		end
	end

## Commands

Reacts to *!np username*


