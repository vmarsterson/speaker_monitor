require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra-websocket'
require_relative './lib/task_tracker.rb'

class Server < Sinatra::Base
    # set :sockets, Array.new

        get "/" do
            erb :index, locals: {speaker_monitor: Speaker_monitor.all}
        end
end