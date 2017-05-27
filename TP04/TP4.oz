% TP 4
% Question 1
local X Y Z in
   thread X = Y + Z end
   Y = 1
   Z = 2
   {Browse X}
end

local X Y Z in
   X = plus(Y Z)
   Y = 1
   Z = 2
   {Browse X}
end

% Question 2
declare 
fun {Counter InS}
   fun {ListAdd L E}
      case L
      of nil then [E#1]
      [] H|T then
         if H.1 == E then
            E#(H.2+1)|T
         else
            H|{ListAdd T E}
         end
      end
   end
   fun {Count InS Acc}
      case InS of
         nil then nil
      [] H|T then Acc2 in
         Acc2 = {ListAdd Acc H}
         Acc2|{Count T Acc2}
      end
   end
in
   thread {Count InS nil} end
end

local
   InS
in
   {Browse {Counter InS}}
   InS = e|m|e|c|_
end

% Question 3
declare
PassingTheToken S1 S2 S3
proc{PassingTheToken Id Tin Tout}
   case Tin of H|T then X in
      {Browse Id#H}
      {Delay 1000}
      Tout = H|X
      {PassingTheToken Id T X}
   end
end
thread {PassingTheToken 1 'token'|S1 S2} end
thread {PassingTheToken 2 S2 S3} end
thread {PassingTheToken 3 S3 S1} end

% Question 4
declare Barman Foo
proc{Barman Sem ?NewB}
   case Sem of jAiBu|T then X in 
      {Delay 5000} % Il sert la bière
      NewB = biere|X
      {Barman T X}
   end
end

proc{Foo Table ?IDrink}
   case Table of biere|T then X in
      {Delay 12000} % Il boit
      IDrink = jAiBu|X
      {Foo T X}
   end
end

declare
B F 
thread {Barman jAiBu|jAiBu|jAiBu|jAiBu|F B} end
thread {Foo B F} end
{Browse B}
{Browse F}

% Question 5
declare MapRecord
proc{MapRecord R1 F R2}
   A={Record.arity R1}
   proc{Loop L}
      case L of nil then skip
      []H|T then
	 thread R2.H = {F R1.H}end
	 {Loop T}
      end
   end
in
   R2={Record.make {Record.label R1} A}
   {Loop A}
end

{Show {MapRecord '#'(a:1 b:2 c:3 d:4 e:5 f:6 g:7)
       fun {$ X}{Delay 1000} 2*X end}}

