
function love.load()
  screen = {}
  screen.width, screen.height = love.window.getDimensions()
  
  player = {}
  player.width = 100
  player.height = 10
  player.speed = 6
  player.cooldown = 10
  player.x = (screen.width - player.width)/2
  player.y = screen.height - player.height 
  player.move = "stop"
  
  player2 = {}
  player2.speed = 2
  player2.width = 100
  player2.height = 10
  player2.x = screen.width/2
  player2.y = player2.height
  
  ball = {}
  ball.width = 10
  ball.height = 10
  ball.x = player.x + (player.width - ball.width)/2
  ball.y = player.y - player.height
  ball.speedy = 3
  ball.speedx = 3
  run = 0
  print(screen.width)
end

function ball_hit()
  if ball.y <= player2.y + 10 then
    ball.speedy = - ball.speedy
  end
    if ball.y > player.y - 10 and ball.x <= player.x + 100 and ball.x >= player.x then
    ball.speedy = - ball.speedy
    
    if love.keyboard.isDown("right") or love.keyboard.isDown("left") then
      ball.speedx = 2 * ball.speedx
    end
  end
    if ball.x >= screen.width - ball.width/2 then
    ball.speedx = - ball.speedx
  end
    if ball.x <= ball.width/2 then
    ball.speedx = - ball.speedx
  end
  if ball.y >= player.y then
    speedx = 0
    speedy = 0

  end

end


function love.update()
  
--  player.cooldown = player.cooldown - 1
--  if love.keyboard.isDown("right") and player.x <= 700 then
--    player.x = player.x + player.speed
    
--    if run == 0 then  
--      ball.x = player.x + 45
    
--    else

--    end
--  elseif love.keyboard.isDown("left") and player.x >= 5 then
--    player.x = player.x - player.speed
    if run == 0 then  
      ball.x = player.x + (player.width - ball.width)/2
      ball.y = player.y - player.height
    end
    
--  elseif love.keyboard.isDown(" ") then
--    run = 1
--  end
  if player.move == "right" and player.x <= screen.width - player.width then
    player.x = player.x + player.speed 
    
  elseif player.move == "left" and player.x >= 0 then
    player.x = player.x - player.speed
    
  
  end

ball_hit()
posball = string.format("x: %s y: %s", ball.x, ball.y)
--print(posball)
      if ball.y >= screen.height then
        game_over = true
        print(ball.y)
        print(screen.height)
      
    elseif ball.y <= 20 then
      game_win = true
      print(ball.y)
      print(screen.height)
      
      end
end

function love.keypressed(key)
  if key == "right" then
    player.move = "right" 
    print("key right pressed")
    
  elseif key == "left" then
    player.move = "left"
    print("key left pressed")
--    elseif key == " " then
--    run = 1
  
  end

end
--love.keyboard.hasKeyRepeat
function love.keyreleased(key)
  if key == "right" then
    if love.keyboard.isDown("left") then
      print("encore left")
    else
      player.move = "stop" 
    end  
    print("key right released")
  elseif key == "left" then
    if love.keyboard.isDown("right") then
      print("encore right")
    else
      player.move = "stop"
    end    
    print("key left released")
  elseif key == " " then
    run = 1
    print("key space released")
  end

end


function love.draw()
  
  if game_over then
    love.graphics.print("Game Over!")
    run = 0
    game_over = false
  elseif game_win then
    love.graphics.print("You Won!")
    run = 0
    game_win = false

  end
  love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
  love.graphics.rectangle("fill", player2.x, player2.y, player2.width, player2.height)
  love.graphics.rectangle("fill", ball.x, ball.y, ball.width, ball.height)
  if run == 1 then
    -- print("toto")
    ball.y = ball.y - ball.speedy
    ball.x = ball.x - ball.speedx
  end
    player2.x = ball.x - 45
end