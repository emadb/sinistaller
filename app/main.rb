require 'rubygems'
require 'bundler'
Bundler.require
require 'sinatra/reloader' if development?

class Sinistaller < Sinatra::Base
  set :port, 9003
  set :server, 'thin'

  get '/' do
    "upload a file posting to /deploy"
  end

  post '/deploy' do
    @filename = params[:package][:filename]
    file = params[:package][:tempfile]
   
    File.open("#{TEMP_FOLDER}#{@filename}", 'wb') do |f|
      f.write(file.read)
    end

    InstallerHelper.unzip_file(@filename)
    InstallerHelper.execute_spec
    "ok"
  end
end