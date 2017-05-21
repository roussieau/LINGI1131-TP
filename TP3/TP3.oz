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