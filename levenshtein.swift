func levenshtein(aStr: String, bStr: String) -> Int
{

    let a = Array(aStr)
    let b = Array(bStr)


    var dist : [[Int]] = Array(repeating: Array(repeating: 0, count: 10), count: 10)


    for i in 1...a.count
    {
        dist[i][0] = i
    }

    for j in 1...b.count
    {
        dist[0][j] = j
    }

    for i in 1...a.count
    {
        for j in 1...b.count
        {
            if a[i-1] == b[j-1]
            {
                dist[i][j] = dist[i-1][j-1]  // NOPE
            }
            else
            {
                dist[i][j] = min(
                    dist[i-1][j] + 1,  // deletion
                    dist[i][j-1] + 1,  // insertion
                    dist[i-1][j-1] + 1  // substitution
                )
            }
        }
    }

    return dist[a.count][b.count]
}


print(levenshtein(aStr: "Bar", bStr: "Biro"))
