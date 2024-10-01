require 'ruby2d'

set title: "Crack an egg", background: "white"

MAX_SCORE = 10
EGG_WIDTH = 150

@sprite = Sprite.new(
  'images/egg.png',
  clip_width: EGG_WIDTH,
  width: EGG_WIDTH,
  height: 150,
  time: 150,
  x: 50, y: 50,
  z: 10,
  loop: false
)

@hammer = Image.new('images/hammer.png', z:20)

@score = 0

@text = Text.new("Score: #{@score.to_s}",
  x: 0, y: 0,
  size: 40,
  color: 'blue',
)

tick = 0
hit_delay = 30
@hit_timer = 0

update do
  if @score >= MAX_SCORE
    @sprite.remove
    Text.new(
      "You won!",
      x: 100, y: 100,
      size: 100,
      color: 'blue',
    )
  end
  if tick % 20 == 0
    @sprite.x = Random.rand(Window.width - EGG_WIDTH)
    @sprite.y = Random.rand(Window.height - @sprite.height)
  end
  tick += 1
end

on :mouse_down do |event|
  unless @score >= MAX_SCORE
       if @sprite.contains?(event.x, event.y)
      @sprite.play
      @score += 1
      @text.text = "Score: #{@score}"
    end
  end
end

on :mouse_move do |event|
  @hammer.x = event.x - @hammer.width / 2
  @hammer.y = event.y - @hammer.height / 2
end
@sprite.play
show