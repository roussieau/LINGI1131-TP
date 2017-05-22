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
L = [4 8 2 5 7 0]
proc{Split L ?L1 ?L2}
   Len = {List.length L} - {List.length L} mod 2
   {Browse Len}
   proc{SplitL L S Acc}
      case L of H|T andthen S == 0 then L1=H|Acc L2=T
      [] H|T then {SplitL T S-1 H|Acc} 
      else skip end
   end
in
   {SplitL L Len nil}
end

{Split L L1 L2}
{Browse [L1 L2]}

fun{Merge1 L1 L2}
   case L1#L2 of L1#nil then L1
   [] nil#L2 then L2
   [] H1|T1#H2|T2 then
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