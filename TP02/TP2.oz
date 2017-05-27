% TP 2
% Question 1
declare Max MaxR
proc{Max L ?MaxR}
   proc{MaxLoop L M ?Ret}
      case L of nil then Ret = M
      [] H|T then
	 if M > H then {MaxLoop T M ?MaxR}
	 else {MaxLoop T H ?MaxR} end
      end
   end
in
   if L == nil then MaxR = error
   else
      {MaxLoop L.2 L.1 MaxR}
   end
end

declare Fact
fun{Fact X}
   fun{FactAcc X Max}
      if X == Max then {ComputeFact X}
      else {ComputeFact X}|{FactAcc X+1 Max}end
   end
   fun{ComputeFact X}
      if X == 0 then 1
      else X*{ComputeFact X-1}end
   end
in
   {FactAcc 1 X}
end
{Browse {Fact 4}}

% Question 2
declare Sum
fun{Sum N}
   fun{TailSum N Acc}
      if N == 0 then Acc
      else
	 {TailSum N-1 Acc+N}
      end
   end
in
   {TailSum N 0}
end

% Question 3
local
   X Y
in {Browse 'hello nurse'}
   X = 2 + Y
   {Browse X}
   Y = 40
end

local
   X Y
in
   {Browse 'hello nurse'}
   X = sum(2 Y)
   {Browse X}
   Y = 40
end

% Question 4
proc{ForAllTail Xs P}
   case Xs of H|T then
      {P H}
      {ForAllTail T P}
   end
end

declare
Tree = tree(info: 10
	    left:tree(info: 7
		      left: nil
		      right:tree(info:9
				 left:nil
				 right:nil))
	    right:tree(info:18
		       left:tree(info:14
				 left: nil
				 right: nil)
		       right:nil))
declare GetElementsInOrder
fun{GetElementsInOrder Tree}
   Y in 
   case Tree of tree(info:Info left:L right:R) then
      if R \= nil then Y=Info|{GetElementsInOrder R} else Y=Info end
      if L \= nil then {GetElementsInOrder L}|Y else Y end
   end
end

{Browse {GetElementsInOrder Tree}}
   

% Question 5
declare Fib
fun{Fib N}
   if N <3 then 1
   else {Fib N-1}+{Fib N-2}end
end

{Browse {Fib 35}}

declare TailFib
fun{TailFib P1 P2 N}
   if N == 0 then  P1
   else P3 in
      P3 = P1 + P2
      {TailFib P2 P3 N-1}
   end
end

{Browse {TailFib 0 1 35}}