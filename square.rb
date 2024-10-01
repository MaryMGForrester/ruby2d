require 'ruby2d'

set title: "Square"
@square = Square.new(
  x: 100, y: 200,
  size: 125,
  color: 'blue',
  z: 10
)




on :key_down do |event|
    if event.key=="down"
        @square.color = "red"
    elsif event.key =="left"
      @square.color = "yellow"
    end
end
show