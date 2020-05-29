class Stack
    def initialize
      # create ivar to store stack here!
      @stack = []
    end

    def push(el)
      # adds an element to the stack
      @stack << el
    end

    def pop
      # removes one element from the stack
      @stack.pop
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      @stack[-1]
    end
  end

  class Queue
    def initialize
        @queue = []
    end

    def enqueue(el)
        @queue << el
    end

    def dequeue
        @queue.shift
    end

    def peek
        @queue[-1]
    end
end

class Map
    def initialize
        @map = Array.new(){Array.new()}
    end

    def set(key,value)
        @map.each do |pair|
            if pair[0] == key
                pair[1] = value
                return "value was changed" 
            end
        end
        @map << [key,value]
    end

    def get(key)
        @map.each {|pair| return pair[1] if pair[0] == key}
        nil
    end

    def delete(key)
        @map.each do |pair|
            if pair[0] == key
                @map.delete(pair)
                return "successfully deleted" 
            end
        end
        "key was not found"
    end

    def show
        @map
    end

end