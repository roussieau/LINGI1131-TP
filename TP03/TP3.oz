% TP 3
% Question 1
local X Y Z in
   thread if X == 1 then Y=2 else Z=2 end end
   thread if Y == 2 then X=1 else Z=2 end end
   X=1
   {Browse [X Y Z]}
end
local X Y Z in
   thread if X == 1 then Y=2 else Z=2 end end
   thread if Y == 1 then X=1 else Z=2 end end
   X=1
   {Browse [X Y Z]}
end

% Question 2
proc{Guess X}
   if X == 42 then skip else skip end
end

% Question 3
declare A B C D in
thread {Browse '1D'} D=C+1 {Browse '2D'} end
thread {Browse '1C'} C=B+1 {Browse '2C'} end
thread {Browse '1A'} A=1 {Browse '2A'} end
thread {Browse '1B'} B=A+1 {Browse '2B'} end
{Browse D}

% Question 4
declare Split Merge1 MergeSort L L1 L2
L = [4 8 2 5 7 0 23 123 32 22 13213 123 2 ~2 ~123412 234 1423 2 23 12 33 23 234 212 23123]
proc{Split L ?L1 ?L2}
   proc{SplitL L Acc1 Acc2}
      case L of nil then
	 L1 = Acc1
	 L2 = Acc2
      [] H1|H2|T then {SplitL T H1|Acc1 H2|Acc2}
      [] H1|nil then {SplitL nil H1|Acc1 Acc2}
      end
   end
in
   {SplitL L nil nil}
end

fun{Merge1 L1 L2}
   case L1#L2 of L1#nil then L1
   [] nil#L2 then L2
   [] (H1|T1)#(H2|T2) then
      if H1 < H2 then H1|{Merge1 T1 L2}
      else H2|{Merge1 L1 T2} end
   end
end
	 
fun {MergeSort L}
   L1 L2
in
   case L
   of nil then nil
   [] [X] then [X]
   else
      {Split L L1 L2}
      {Merge1 thread {MergeSort L1} end
       thread {MergeSort L2} end }
   end
end

{Browse {MergeSort L}}

% Question 5 & 6
declare S
proc{Prod X ?Out}
   if X == 10000 then Out = X|nil
   else S2 In in
      Out = X|In
      {Prod X+1 In}
   end
end
{Prod 0 S}
fun{Cons S Acc}
   case S of H|T then
      if H mod 2 == 0 then {Cons T Acc+H}
      else {Cons T Acc} end
   else Acc end
end
{Browse {Cons S 0}}

% Question 7
declare BuildThread
proc{BuildThread}
   {Browse "hello"}
   thread {BuildThread} end
   thread {BuildThread} end
   thread {BuildThread} end
   thread {BuildThread} end
   thread {BuildThread} end
   thread {BuildThread} end
   thread {BuildThread} end
   thread {BuildThread} end
   thread {BuildThread} end
end
{BuildThread}

% Question 8
declare Ping Pong Clock
proc{Ping L}
   case L of H|T then T2 in
      {Delay 500}{Browse ping}
      T=_|T2
      {Ping T2}
   end
end

proc{Pong L}
   case L of H|T then T2 in
      {Browse pong}
      T=_|T2
      {Pong T2}
   end
end
proc{Clock ?L}
   In in
   L = 1|In
   {Clock In}
end


declare L in
thread {Ping L}end
thread {Pong L.2} end
L=_|_



   