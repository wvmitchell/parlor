require 'sinatra'

class Parlor::Games < Sinatra::Base

  set :static, true
  set :public_folder, File.expand_path('..', __FILE__) # set up the static dir (with images/js/css inside)
  set :views,  File.expand_path('../views', __FILE__) # set up the views dir
  set :haml, { :format => :html5 }

  get '/' do
    'Hello Parlor!'
  end

end

Parlor::Games.run!
