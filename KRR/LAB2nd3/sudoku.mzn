%%%%%%%%%%%
% REMINDER 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% There's something missing here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


include "alldifferent.mzn";
%%%%%%%%%%%
% PARAMETERS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initial state of the board
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

int: S=3;
int: N = S*S;
set of int: Range = 1..N;
set of int: SubRange = 1..S;


%%%%%%%%%%% 
% VARIABLES  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% You know...
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
array[1..N,1..N] of var 0..N: start; %% initial board
array[1..N,1..N] of var 0..N: puzzle;
%%%%%%%%%%%%%%%%
% Constraints 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% - you know the sudoku rules
% - remember, that you have to preserve the initial state of the board  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
constraint forall(i,j in Range)( if start[i,j] > 0 then puzzle[i,j] = start[i,j] else true endif );
constraint forall (i in Range) ( alldifferent( [ puzzle[i,j] | j in Range ]) ); 
constraint forall (j in Range) ( alldifferent( [ puzzle[i,j] | i in Range ]) );
constraint forall (a, o in SubRange)(alldifferent( [ puzzle[(a-1)*S + a1, (o-1)*S + o1] |a1, o1 in SubRange ] ) );

solve satisfy;

%%%%%%%%%%%%%%%%%%%%
% OUTPUT EXAMPLE  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% - puzzle - 2d array of nxn variables
% - N - size of the board, equal S*S         
% - S - size of a single sector            
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

output [ show(puzzle[i,j]) ++ " " ++
if j mod S == 0 then " " else "" endif ++ if j == N /\ i != N then
  if i mod S == 0 then "\n\n" else "\n" endif else "" endif
    | i,j in Range ] ++ ["\n"];