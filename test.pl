
% SAMPLE DEPENDENCY_DEPENDENT
%a(X,Y) :- b(X,Z), c(Y,Z).


% DEPENDENCY_G_INDEPENDENT
% a(X) :- b(X), c(X).
% DEPENDENCY_G_I_INDEPENDENT 
% a(X,Y,Z) :- b(X,Y), c(X,Z).
% DEPENDENCY_I_INDEPENDENT
% a(X,Y) :- b(X), c(Y).
% DEPENDENCY_INDEPENDENT
% a(X) :- b(Y), c(Z). 


%a([A|B]) :- b(A), c(B).

a([A],[B]) :- b([[A]]), c([B]).


