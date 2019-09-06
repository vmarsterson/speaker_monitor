require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra-websocket'
require_relative './lib/speaker_monitor.rb'

class Server < Sinatra::Base
    # set :sockets, Array.new
    get "/" do
        erb :landing
    end

    get '/add_speaker' do
        erb :create 
    end

    post '/add_speaker' do
        company = params["company"]
        name = params["name"]
        talk_type = params["talk_type"]
        bio = params["bio"]
        food = [params["food1"], params["food2"], params["food3"], params["food4"], params["food5"]].join(",")
        avatar = params["avatar"]
        responsible = Team_member.find_by(name: params["team"])
        that_members_id = responsible.id
        puts params.inspect
        Speaker.create(name: name, company: company, talk_type: talk_type, bio: bio, food: food, avatar: avatar, team_member_id: that_members_id)
        id = Speaker.all.last.id
        redirect "/"
    end

    get '/display_speaker' do
        erb :index, locals: {speakers: Speaker.all}
    end

    get '/remove_speaker/:id' do 
        Speaker.delete(params[:id])
        redirect "/display_speaker"
    end

    get '/team_display' do
        member = Team_member.find_by(name: params["name"])
        if member.nil?
            erb :landing
        else
            erb :team, locals: {team_member: member}
        end
    end
end