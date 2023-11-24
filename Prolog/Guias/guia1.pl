% Ejercicio 3

% 3) Adivinar un número secreto en el rango de 1 a 100, que debe ser generado
% aleatoriamente. Debe indicar, para cada intento del usuario, si el número secreto
% es mayor, si es menor o se ha acertado. Al final, también desplegar la cantidad
% de intentos realizados. Investigue el funcionamiento del predicado predefinido
% random/1.

number_to_guess(X) :- random(N), is(X, floor(*(N, 101))).

play() :-
    number_to_guess(NumberToGuess),
    play(NumberToGuess, 0).

play(NumberToGuess, Attempts) :-
    write("Guess a number between 1 and 100: "),
    read(Guess),
    NewAttempts is Attempts + 1,
    guess_number(NumberToGuess, Guess, NewAttempts).

guess_number(NumberToGuess, Guess, Attempts) :-
    =:=(NumberToGuess, Guess),
    write("You guessed it in "), write(Attempts), write(" attempts!"), nl,
    !.

guess_number(NumberToGuess, Guess, Attempts) :-
    >(NumberToGuess, Guess),
    write("The number is greater than "), writeln(Guess), nl,
    play(NumberToGuess, Attempts).

guess_number(NumberToGuess, Guess, Attempts) :-
    <(NumberToGuess, Guess),
    write("The number is less than "), writeln(Guess), nl,
    play(NumberToGuess, Attempts).
