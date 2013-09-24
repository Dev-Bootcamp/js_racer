get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/results/:id' do
  @game = Game.find(params[:id])


  erb :results
end


get '/game/:id/:player_a/:player_b' do
  @game = Game.find(params[:id])
  @player_a = Player.find(params[:player_a])
  @player_b = Player.find(params[:player_b])
  erb :game
end

#+++++++++++++++++++++++++post


post '/creategame' do
 
  player_1 = params[:player1_name]
  player_2 = params[:player2_name]
  @game = Game.create
  @player_a = Player.create(name: player_1)
  @player_b = Player.create(name: player_2)
  @game.players << @player_a
  @game.players << @player_b
  redirect to ("/game/#{@game.id}/#{@player_a.id}/#{@player_b.id}")
end

post '/creategame/:id/:player_a/:player_b' do 
  @game = Game.create
  @player_a = Player.find(params[:player_a])
  @player_b = Player.find(params[:player_b])
  @game.players << @player_a
  @game.players << @player_b
  redirect to ("/game/#{@game.id}/#{@player_a.id}/#{@player_b.id}")
end

