function raindrops(number)
    res = ""
    if number % 3 == 0
        res = res * "Pling"
    end

    if number % 5 == 0
        res = res * "Plang"
    end

    if number % 7 == 0
        res = res * "Plong"
    end

    if res == ""
        return string(number)
    else 
        return res
    end

end
