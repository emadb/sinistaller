require 'sinatra'
require 'zip'
require 'json'

root = ::File.dirname(__FILE__)
Dir["app/*.rb"].each { |file| require ::File.join( root, file ) }

TEMP_FOLDER = './uploads/'
DEST_FOLDER = './destination/'

run Sinistaller