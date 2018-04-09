
% Parameters
%%%%%%%%%%%
   include "globals.mzn"; 

    % Size of the biggest square.
int: n;
    % All squares from size 1x1, 2x2, to NxN.
set of int: SQUARES = 1..n;
    % Including the square of size 1 in the search and constraints. The reason
    % for a non-consideration is justified by the observation that it can be
    % placed in any free spot in the rectangle.
int: Consider_Unit_Square;



    % Upper bound for the width
int: max_width  = sum([ i | i in SQUARES where i >= (n div 2) + 1 ]);
    % Lower bound for the height
int: min_height = if n mod 2 == 1 then n else n + 1 endif;
    % Lower bound for the width
int: min_area   = sum([ i * i | i in SQUARES ]);
    % Upper bound for the area
int: max_area   = max_width * min_height;
    % Upper bound for the height
int: max_height = floor( sqrt( int2float( max_area ) ) );
    % Lower bound for the width
int: min_width  = ceil(  sqrt( int2float( min_area ) ) );

%------------------------------------------------------------------------------%
% Model variables.
%

    % X-coordinate of the square's origin (left lower corner)
array [ SQUARES ] of var 0..max_width : X;
    % Y-coordinate of the square's origin (left lower corner)
array [ SQUARES ] of var 0..max_height: Y;
    
    % The width  of the rectangle
var min_width..max_width : Width;
    % The height of the rectangle
var min_height..max_height: Height;
    % The area   of the rectangle
var min_area..max_area: Area;

%-----------------------------------------------------------------------------%
% Predicates.
%

test consider_square( int: i ) =
    (   i > 1
    \/  Consider_Unit_Square == true
    );

%-----------------------------------------------------------------------------%
% Constraints.
%

    % Non-overlap constraints between two squares
constraint
    forall( i, j in SQUARES where i < j /\ consider_square(i) /\ consider_square(j) ) (
        -X[i] + j <= -X[j] 
    \/  -X[j] + i <= -X[i] 
    \/  -Y[i] + j <= -Y[j]
    \/  -Y[j] + i <= -Y[i]
    );

    % Constraints on the variables of the rectangle
constraint
            % Height is the smaller side
        Height <= Width
            % Area is equals the product of its sides
    /\  Area = Height * Width;

    % Constraints on the x variables
constraint
            % SQUARES must be inside the rectangle
        forall( i in SQUARES where consider_square(i) ) (
            X[i] + i <= Width
        )
            % Ensure a "non-overload" of the height
    /\  cumulative(
            [ X[i] | i in SQUARES where consider_square(i) ],
            [   i  | i in SQUARES where consider_square(i) ],
            [   i  | i in SQUARES where consider_square(i) ],
            Height
        );

    % Constraints on the y variables
constraint
            % SQUARES must be inside the rectangle
        forall( i in SQUARES where consider_square(i) ) (
            Y[i] + i <= Height
        )
            % Ensure a "non-overload" of the width
    /\  cumulative(
            [ Y[i] | i in SQUARES where consider_square(i) ],
            [   i  | i in SQUARES where consider_square(i) ],
            [   i  | i in SQUARES where consider_square(i) ],
            Width
        );

    % In the case of non-consideration of the unit square its origin is
    % assigned to (0, 0).
constraint
    if Consider_Unit_Square == false then X[1] = 0 /\ Y[1] = 0 else true endif;



% Objective.
%
%%Goal
solve minimize Area; 
%solve


% Boring output  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
output [ show(i) ++ " > (" ++ show(X[i]) ++ "," ++ show(Y[i]) ++ ")\n" | i in 1..n] ++
  ["area = " ++ show(Width) ++ " * " ++ show(Height) ++ " = " ++ show(Area)]
