let filter = Array.make 100 false

let hashes = [
(fun x -> x mod 45);
(fun x -> x mod 51);
(fun x -> x mod 57);
(fun x -> x mod 84);
(fun x -> x mod 92);
(fun x -> x mod 29)]

let bloom = (filter, hashes)

let print_result = function
        | Bloom.Possibly -> print_string "Possibly"
        | Bloom.Not -> print_string "Not"

let query_test x bf = print_int x; print_string " "; print_result (Bloom.query x bf); print_string "\n"

let print_bool = fun x -> print_string (string_of_bool x)

let qt = fun x -> query_test x bloom
let add = fun x -> Bloom.add x bloom

let _ = add 25;
        qt 25;
        qt 12;
        qt 8;
        add 220;
        qt 15;
        qt 330;
        qt 180;
        qt 70;
