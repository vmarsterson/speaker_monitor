require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra-websocket'
require_relative './lib/speaker_monitor.rb'

class Server < Sinatra::Base
    # set :sockets, Array.new

        get "/" do
            erb :index
        end
end