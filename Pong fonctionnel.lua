
function love.load()
  player = {}
  player.x = 5
  player.y = 575
  player.speed = 6
  player.cooldown = 10
  player2 = {}
  player2.x = 5
  player2.y = 5
  player2.speed = 2
  ball = {}
  ball.x = player.x + 45
  ball.y = player.y - 10
  ball.speedy = 3
  ball.speedx = 3
  run = 0
end

function ball_hit()
  if ball.y <= player2.y + 10 then
    ball.speedy = - ball.speedy
  end
    if ball.y > player.y - 10 and ball.x <= player.x + 100 and ball.x >= player.x then
    ball.speedy = - ball.speedy
  end
    if ball.x >= 745 then
    ball.speedx = - ball.speedx
  end
    if ball.x <= 5 then
    ball.speedx = - ball.speedx
  end
end


function love.update()
  
    player.cooldown = player.cooldown - 1
  if love.keyboard.isDown("right") and player.x <= 700 then
    player.x = player.x + player.speed
    if run == 0 then  
      ball.x = player.x + 45
    end
  
  elseif love.keyboard.isDown("left") and player.x >= 5 then
    player.x = player.x - player.speed
    if run == 0 then  
      ball.x = player.x + 45
    end
    
  elseif love.keyboard.isDown(" ") then
    run = 1
  end

ball_hit()

end

function love.draw()
  
  love.graphics.rectangle("fill", player.x, player.y, 100, 10)
  love.graphics.rectangle("fill", player2.x, player2.y, 100, 10)
  love.graphics.rectangle("fill", ball.x, ball.y, 10, 10)
  if run == 1 then
    ball.y = ball.y - ball.speedy
    ball.x = ball.x - ball.speedx
  end
    player2.x = ball.x - 45
end