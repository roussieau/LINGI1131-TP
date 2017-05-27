% TP6 : Laziness
% Question 1
declare Gen
fun lazy{Gen I}
   I|{Gen I+1}
end
X = {Gen 1}
Y = X.2.2.1
{Browse X}

fun{GiveMeNth N L}
   case L of H|T andthen N == 1 then H
   [] H|T then  {GiveMeNth N-1 T}
   end
end

{Browse {GiveMeNth 5 X}}

% Question 2
declare
fun lazy{Primes}
   fun lazy{PrimesI N}
      N|{PrimesI N+2}
   end
in
   {PrimesI 0}
end

% Question 3
proc{ShowPrimes N}
   L = {Primes}
   fun{ToShow L N}
      case L of H|T andthen N==0 then nil
      []H|T then H|{ToShow T N-1}
      end
   end
in
   {Browse {ToShow L N}}
end

{ShowPrimes 7}

% Question 4
declare 
fun{Gen I N}
   {Delay 500}
   if I == N then [I] else I|thread {Gen I+1 N}end end
end
fun {Filter L F}
   case L of nil then nil
   [] H|T then
      if {F H} then H|{Filter T F} else thread {Filter T F} end end
   end
end
fun{Map L F}
   case L of nil then nil
   [] H|T then {F H}|thread {Map T F}end
   end
end

declare Xs Ys Zs
{Browse Zs}
{Gen 1 100 Xs}
{Filter Xs fun {$ X} (X mod 2) == 0 end Ys}
{Map Ys fun{$ X} X*X end Zs}

% Question 5

