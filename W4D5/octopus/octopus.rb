def longest_fish(arr)
    merge_sort(arr)[-1]
end

def merge_sort(arr)
    return arr if arr.length <= 1
    mid = arr.length/2
    left_part = arr[0...mid]
    right_part = arr[mid..-1]
    left = merge_sort(left_part)
    right = merge_sort(right_part)
    merge(left,right)
end

def merge(left,right)
    i = 0
    j = 0
    arr = []
    while i < left.length && j < right.length
        if left[i].length < right[j].length
            arr << left[i]
            i += 1
        else
            arr << right[j]
            j += 1
        end
    end
    if i < left.length
        arr += left[i..-1]
    end
    if j < right.length
        arr += right[j..-1]
    end
    arr
end

# O(n)
def clever_octopus(fish_arr)
    longest_fish = ""
    fish_arr.each {|fish| longest_fish = fish if fish.length > longest_fish.length}
    longest_fish
end


fish_arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

p longest_fish(fish_arr)
p clever_octopus(fish_arr)


def fast_dance(tentacle,tiles_array)
    tiles_array.index(tentacle)
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
p fast_dance("up", tiles_array)
