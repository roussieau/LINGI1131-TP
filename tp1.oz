% TP 1
% Question 2
{Browse 'hello Nurse'}
{Browse "hello Nurse"}

% Question 3
local
   X=x Y=y Z=z
in
   {Browse [X Y Z]}
end

local
   X=x Y=y Z=z
in
   {Browse test(un:X deux:Y trois:Z)}
end

%Question 4
local F1 = fun {$X} X*X end
      F2 = fun {$X} X+X end
in
   {Browse ({F1 3.0} - {F2 3.0}) + 4.0}
end

%Question 5
declare Root
fun{Root A B C}
   Rho B2 AC4 Num Div Final in
   B2 = (B*B)
   AC4 = A*C*4.0
   Rho = B2-AC4
   Num = Rho - B
   Div = A*2.0
   Num / Div
end

{Browse {Root 1.0 5.0 ~150.0}}

%Question 6
local X in
   X = a
   X = b 
end

local X in
   X = a
   local X in
      X = b
   end
end

local
   Y = 1
   X = 1
in
   local
      Y = 2
   in
      {Browse [X Y]}
   end
   {Browse [X Y]}
end

%Question 7
{Browse '#'(a:5 b:2 3 4) == '#'(1:3 b:2 a:5 2:4)}

%Question 9
% A
local X Y in
   X = 1|2|Y
   X = Y
   {Browse X.2.2.1}
end

local X Y Z in
   X = 1|X
   Y = X|2
   Z = 2|3|4|nil
   {Browse Y.1.2.1}
end

local X Y Z in
   X = a(b X)
   Y = c(X Z)
   Z = d(e f g h)
   {Browse Y.1.2.1}
end