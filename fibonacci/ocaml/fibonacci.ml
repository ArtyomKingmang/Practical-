module U = Unix
module S = Stream

let round (x : float) : int = int_of_float (floor (x +. 0.5))

let fib (n : int) : int =
  let sq5 = sqrt 5. in
  let phi = (1. +. sq5) /. 2.
  in round (phi ** (float_of_int n) /. sq5)

let fibs : int S.t = S.from (fun x -> Some (fib x))

let backoff (_ : unit) : unit =
  let sleep_time = S.next fibs in
  print_endline ("Sleeping for " ^ (string_of_int sleep_time) ^ "s");
  U.sleep sleep_time

let () =
  while true do
    backoff ()
  done