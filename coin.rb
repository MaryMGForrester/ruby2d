require 'ruby2d'

coin = Sprite.new(
  'egg.png',
  clip_width: 150,
  time: 300,
  loop: true
)
coin.play
show