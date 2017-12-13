type couleur = Pique | Coeur | Carreau | Trefle ;;
type rang = Valeur of int;;
type carte = Carte of rang * couleur ;;
type donne = Main of carte*carte;;
type table = Flop of carte*carte*carte | Turn of carte*carte*carte*carte | River of carte*carte*carte*carte*carte;;
type comb = QuinteFlush of rang
	   | Carre of rang*rang(*suite de 4*)
	   | Full of rang*rang(*suite de 3*)
	   | Couleur of rang*rang*rang*rang*rang (*en cas d'�galit� faut verifier la carte suivante*)
	   | Suite of rang
	   | Brelan of rang*rang*rang
	   | DoublePaire of rang*rang*rang (*1er rang -> 1er paire, 2�me rang -> 2�me paire, 3�me -> derni�re carte*)
	   | Paire of rang*rang*rang*rang(*1er rang -> 1er paire, le reste des rangs sont les cartes qu'on compare en cas d'�galit�*)
	   | CarteHaute of rang*rang*rang*rang*rang(*Compare la meilleur rang et en cas d'�galit� on regarde la prochaine plus forte et ainci de suite*);;

let compare_hands d1 d2 t = ;;

let valeur_comb c = match c with
  | QuinteFlush r -> print_endline("QuinteFlush"); 9
  | Carre (r1,r2) -> print_endline("Carre"); 8
  | Full  (r1,r2) ->  print_endline("Full"); 7
  | Couleur (r1,r2,r3,r4,r5) -> print_endline("Couleur"); 6
  | Suite r -> print_endline("Suite"); 5
  | Brelan (r1,r2,r3) ->  print_endline("Brelan"); 4
  | DoublePaire (r1,r2,r3) ->  print_endline("DoublePaire"); 3
  | Paire (r1,r2,r3,r4) -> print_endline("Paire"); 2
  | CarteHaute (r1,r2,r3,r4,r5) -> print_endline("CarteHaute"); 1
;;


(* WTF *)
(* Compare deux combinaisons "du m�me type" *)
let compare_comb_equals c1 c2 = match c1, c2 with
	| (QuinteFlush r), (QuinteFlush r2) = if r > r2 then 1
									  else if r < r2 then -1
									  else 0
	| _ -> 2
;;

let compare_comb c1 c2 =
	if valeur_comb c1 > valeur_comb c2 then 1
	else if valeur_comb c2 > valeur_comb c1 then -1
	else compare_comb_equals c1 c2
;;

(*Pas fini*)
let compute_comb d t =
  let l = Array.make 13 0
  and coeur = Array.make 13 false
  and pique = Array.make 13 false
  and trefle = Array.make 13 false
  and carreau = Array.make 13 false
  and card = list_card d t 
  and let rec aux c =
  match c with
  |[] -> ()
  |h::tl -> match h with
            |
;;

let list_card d t =
  let l = [] in
  match d with
  | Main (c1,c2) -> match t with
             | Flop (c3,c4,c5) -> (c1::(c2::(c3::(c4::(c5::l)))))
             | Turn (c3,c4,c5,c6) -> (c1::(c2::(c3::(c4::(c5::(c6::l))))))
             | River (c3,c4,c5,c6,c7) -> (c1::(c2::(c3::(c4::(c5::(c6::(c7::l)))))))
;;
  
let test1 = QuinteFlush(Valeur(10));;
let test2 = QuinteFlush(Valeur(9));;

compare_comb test1 test2;;  
             
