% Integrar una constante
integrar(X, C, Resultado) :- number(C), !, Resultado = C*X.
 
% Integrar una variable
integrar(X, X, Resultado) :- !, Resultado = X^2/2.
 
% Integrar una potencia de una variable
integrar(X, X^N, Resultado) :- number(N), N1 is N + 1, !, Resultado = (X^N1)/(N1).
 
% Integrar C por una variable
integrar(X, C*X, Resultado) :- number(C), !, Resultado = C*X^2/2.
 
% Integrar C por una potencia de una variable
integrar(X, C*X^N, Resultado) :- number(C), number(N), N1 is N + 1, !, Resultado = C*(X^N1)/(N1).
 
integrar(X, F1 + F2, Resultado) :-
    integrar(X, F1, I1),
    integrar(X, F2, I2),
    !, Resultado = I1 + I2.
 
integrar(X, F1 - F2, Resultado) :-
    integrar(X, F1, I1),
    integrar(X, F2, I2),
    !, Resultado = I1 - I2.


calcular_integral(X, F) :-
      integrar(X, F, Integrar),
      assert((evaluar_integral(X, R) :- is(R, Integrar))).

% Función principal para calcular el área
  % Función principal para calcular el área
area(X, Polinomio, LimiteInferior, LimiteSuperior, Area) :-
  calcular_integral(X, Polinomio),
  evaluar_integral(LimiteInferior, ResultadoA),
  evaluar_integral(LimiteSuperior, ResultadoB),
  Area is ResultadoB - ResultadoA.
