get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/results/:id' do
  @game = Game.find(params[:id])


  erb :results
end


get '/game/:id' do
  @game = Game.find(params[:id])
  @player_a = Player.find(@game.players[0].id)
  @player_b = Player.find(@game.players[1].id)
  erb :game
end

#+++++++++++++++++++++++++post


post '/creategame' do
  @game = Game.create
  @player_a = Player.find_or_create_by(name: params[:player1_name])
  @player_b = Player.find_or_create_by(name: params[:player2_name])
  @game.players << @player_a
  @game.players << @player_b
  redirect to ("/game/#{@game.id}")
end

post '/creategame/:player_a/:player_b' do 
  @game = Game.create
  @player_a = Player.find_or_create_by(id: params[:player_a])
  @player_b = Player.find_or_create_by(id: params[:player_b])
  @game.players << @player_a
  @game.players << @player_b
  redirect to ("/game/#{@game.id}")
end

