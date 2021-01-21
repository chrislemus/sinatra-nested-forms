require './environment'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    get('/') {
      erb :root
    }

    get('/new') {
      erb :'pirates/new'
    }

    post('/pirates') {
      pi = params['pirate']
      @pirate = Pirate.new(pi['name'], pi['weight'], pi['height'])
      s1 = params['pirate']['ships'][0]
      s2 = params['pirate']['ships'][1]
      @s1 = Ship.new(s1['name'], s1['type'], s1['booty'])
      @s2 = Ship.new(s2['name'], s2['type'], s2['booty'])
      # puts "#{s1['name']} #{s1['type']} #{s1['booty']}"
      erb :'pirates/show'
    }
  end
end
