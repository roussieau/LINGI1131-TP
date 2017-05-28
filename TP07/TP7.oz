% TP7 : More laziness and the limitations of declarative concurrency
% Question 1
declare
fun lazy{Ints N} N|{Ints N+1} end
fun lazy{Sum2 Xs Ys}
   case Xs#Ys of (X|Xr)#(Y|Yr) then (X+Y) |{Sum2 Xr Yr} end
end

S=0|{Sum2 S {Ints 1}}

{Browse S.2.2.2.2.1}

% Question 3
declare
proc{Job Type Flag}
   {Delay {OS.rand} mod 100}
   {Browse Type}
   Flag = unit
end

proc{BuildPs N Ps}
   Ps = {Tuple.make '#' N}
   for I in 1..N do
      Type = {OS.rand} mod 10
      Flag
   in
      Ps.I = ps(type:Type job:proc{$} {Job Type Flag} end flag:Flag)
   end
end

N=100
Ps = {BuildPs N}
for I in 1..N do
   thread {Ps.I.job} end
end
    