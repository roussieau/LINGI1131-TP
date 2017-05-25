% TP 5
% Question 1
declare
Numbers SumAndCount FilterList
L1 L2 Ys S N
fun{Numbers N I J}
   D = J-I
   Modulo = ({OS.rand} mod D)
   Random = Modulo + I
in
   if N == 0 then nil
   else
      {Delay 500}
      Random|thread {Numbers N-1 I J} end
   end
end

proc{SumAndCount L ?S ?N}
   proc{SumAndCountI L AccS AccN}
      {Delay 250}
      case L of nil then
	 S = AccS
	 N = AccN
      [] H|T then {SumAndCountI T AccS+H AccN+1}
      end
   end
in
   {SumAndCountI L 0 0}
end

fun{FilterList Xs Ys}
   case Xs of nil then nil
   []H|T then
      if {List.member H Ys} then {FilterList T Ys}
      else H| thread {FilterList T Ys}end
      end
   end
end

Ys = [3 5 12 34 22 34 32 1]
L1 = {Numbers 10 5 10}
{Browse ['L1' L1]}
L2 = {FilterList L1 Ys}
{Browse ['L2' L2]}
{SumAndCount L2 S N}
{Browse [S N]}

% Question 2
declare NotGate OrGate AndGate
fun{NotGate S}
   case S of nil then nil
   [] H|T then
      if H == 0 then 1|thread {NotGate T}end
      else 0|thread {NotGate T} end
      end
   end
end

fun{AndGate S1 S2}
   case S1#S2 of nil#nil then nil
   [](H1|T1)#(H2|T2) then
      if H1 == 1 andthen H2 == 1 then 1|thread{AndGate T1 T2}end
      else 0|thread{AndGate T1 T2} end end
   end
end

fun{OrGate S1 S2}
   case S1#S2 of nil#nil then nil
   [](H1|T1)#(H2|T2) then
      if H1 == 1 orelse H2 == 1 then 1|thread{OrGate T1 T2}end
      else 0|thread{OrGate T1 T2}end end
   end
end
declare
X = 1|0|1|0|_
Y = 0|1|0|1|_
Z = 1|1|0|0|_

{Browse {OrGate {AndGate X Y} {NotGate Z}}}

% Question 3
declare
L1 L2 F
L1 = [1 2 3]
F = fun{$ X} {Delay 200} X*X end
thread L2 = {Map L1 F}end
{Wait L2}
{Show L2}

declare
proc{Buffer N ?Xs Ys}
   fun{Startup N ?Xs}
      if N == 0 then Xs
      else Xr in Xs=_|Xr {Startup N-1 Xr}end
   end
   proc{AskLoop Ys ?Xs ?End}
      case Ys of Y|Yr then
	 Xr End2
      in
	 Xs=Y|Xr %Get element from buffer
	 End = _|End2 %Replenish the buffer
	 {AskLoop Yr Xr End2}
      end
   end
   End={Startup N Xs}
in
   {AskLoop Ys Xs End}
end
proc{DGenerate N Xs}
   case Xs of X|Xr then X=N{ DGenerate X+1 Xr}end
end
fun{DSum01 ?Xs A Limit}
   {Delay {OS.rand} mod 10}
   if Limit>0 then
      X|Xr=Xs
   in
      {DSum01 Xr A+X Limit-1}
   else A end
end
fun{DSum02 ?Xs A Limit}
   {Delay {OS.rand} mod 10}
   if Limit > 0 then
      X|Xr = Xs
   in
      {DSum02 Xr A+X Limit-1}
   else A end
end
local Xs Ys V1 V2 in
   thread {DGenerate 1 Xs} end
   thread {Buffer 4 Xs Ys} end
   thread V1 = {DSum01 Ys 0 1500}end
   thread V2 = {DSum02 Ys 2 1500} end
   {Browse [Xs Ys V1 V2]}
end