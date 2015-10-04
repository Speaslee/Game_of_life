def neighbors(cell)
  neighbors = []
  x = cell[0]
  y = cell[1]
  (x-1..x+1).each do |xx|
    (y-1..y+1).each do |yy|
     next if xx==x && yy==y
     neighbors.push([xx,yy])
    end
  end
  neighbors
end

def step(grid)
  living = []
  dead= []

  grid.each do |cell|
    alive_neighbors  = []
    frankenneighbors = neighbors(cell)

    frankenneighbors.each do |neighbor|
      if (grid.include?(neighbor))
        alive_neighbors.push(neighbor)
      elsif (!dead_neighbors.include?(neighbor))
        dead_neighbors.push(neighbor)
      end
    end
    living.push(cell) if (alive_neighbors.count >= 2 && alive_neighbors.count <= 3)
  end

  # all dead neighbors
  dead_neighbors.each do |cell|
    alive_neighbors  = []
    frankenneighbors = neighbors(cell)

    frankenneighbors.each do |this_neighbor|
      alive_neighbors.push(neighbor) if (grid.include?(neighbor))
    end
    living.push(cell) if (alive_neighbors.count == 3)
  end

  living
end

def display(board,size=40)
  (1..size).each do |row|
    str = ""
    (1..size).each do |col|
      if (board.include?([row,col]))
        str += "O"
      else
        str += " "
      end
    end
    puts str
  end
end

def game_of_life(start_gen,generations)
grid = start_gen
  while(generations>0)
    display(grid)
    living = step(grid)
    generations -= 1
    grid = living
    sleep 0.1
  end
end

start_gen = [[2,1],[3,2],[1,3],[2,3],[3,3]]
game_of_life(start_gen,150)
