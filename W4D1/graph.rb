class GraphNode
    attr_reader :value, :neighbors
    def initialize(value)
        @value = value
        @neighbors = []
    end

    def neighbors=(arr)
        arr.each {|node| @neighbors << node if !@neighbors.include?(node) }
    end

end

def bfs(starting_node, target_value)
        queue = [starting_node]
        set = []
        while !queue.empty?
            first_ele = queue.shift
            set << first_ele
            if first_ele.value == target_value
                return first_ele
            else
                first_ele.neighbors.each {|n| queue.push(n) if !set.include?(n)}
            end
        end
        nil
    end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p bfs(a, "b")
p bfs(a, "f")