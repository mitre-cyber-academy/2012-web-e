require 'sinatra'
require 'tempfile'


class String
  def ^( other )
    b1 = self.unpack("U*")
    b2 = other.unpack("U*")
    longest = [b1.length,b2.length].max
    b1 = [0]*(longest-b1.length) + b1
    b2 = [0]*(longest-b2.length) + b2
    b1.zip(b2).map{ |a,b| a^b }.pack("U*")
  end
end

class Application < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :views, settings.root + "/views"
  set :public_folder, settings.root + '/public'
  set :show_exceptions, false

  get '/' do
    haml :index
  end
  
  get %r{/(turtles/)+} do
    haml :turtles
  end

  post %r{/(turtles/)+} do
    if !params[:name].nil?
      "Flag is #{"|rt\u001Cw{v\fq\t\u000F\u000F" ^ params[:name][0..-request.path.scan('turtles').count]}"
    else
      "It's turtles all the way down but we need your ID...\n"*4
    end
  end
end