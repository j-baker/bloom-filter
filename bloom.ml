type result = Possibly | Not

type 'a bloom = bool array * ('a -> int) list

let add e (filter, hashes) =
        let rec add = function
                | [] -> ()
                | h::hs -> filter.(h e) <- true
        in
        add hashes

let query e (filter, hashes) =
        let rec query = function
                | [] -> Not
                | h::hs -> if filter.(h e) then Possibly else query hs
        in
        query hashes
