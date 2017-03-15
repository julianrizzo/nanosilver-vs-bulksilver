require 'sinatra'
require 'sinatra/json'
require 'sinatra/asset_pipeline'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require 'sinatra/base'
require 'sass'
require 'slim'

class App < Sinatra::Base

	(Dir['./models/*.rb'].sort).each do |file|
		require file
	end

	(Dir['./helpers/*.rb'].sort).each do |file|
		require file
	end

	set :root, File.dirname(__FILE__)
	set :public_folder, File.dirname(__FILE__) + '/public/'
	set :assets_prefix, %w(app/assets vendor/assets)

	set :assets_precompile, %w(application.css application.js vendor.css vendor.js *.png *.jpg *.svg *.eot *.ttf *.woff)

	set :assets_css_compressor, :sass

	register Sinatra::AssetPipeline
	
	configure :development do
		register Sinatra::Reloader
	end
	
	get '/' do
		@today = Date.today
		slim :index
	end
end