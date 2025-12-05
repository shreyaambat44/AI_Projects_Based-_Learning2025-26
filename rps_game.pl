% ------------------------------
% Rock Paper Scissors Game
% cd('C:/Users/apurw/OneDrive/Desktop').
% ['rps_game.pl'].
% start.
% play.
% rock.
% paper.
% scissors.
% ------------------------------

:- use_module(library(random)).

choice(rock).
choice(paper).
choice(scissors).

start :-
    write('🔥 Rock–Paper–Scissors Game!'), nl,
    write('Choose: rock, paper, or scissors.'), nl,
    write('Type play. to begin!'), nl.

play :-
    random_choice(Computer),
    write('Your move: '),
    read(Player),
    ( valid(Player) ->
        format('🤖 Computer chose: ~w~n', [Computer]),
        result(Player, Computer)
    ;
        write('❌ Invalid choice. Type rock, paper, or scissors.'), nl,
        play
    ),
    ask_restart.

% Random computer choice
random_choice(C) :-
    findall(X, choice(X), L),
    random_member(C, L).

% Validate user's input
valid(X) :- choice(X).

% Decide result
result(Player, Player) :-
    write('😐 It\'s a draw!'), nl.

result(rock, scissors) :-
    write('🎉 You win! Rock crushes scissors!'), nl.

result(paper, rock) :-
    write('🎉 You win! Paper covers rock!'), nl.

result(scissors, paper) :-
    write('🎉 You win! Scissors cut paper!'), nl.

result(_, _) :-
    write('💀 You lose!'), nl.

% Restart question
ask_restart :-
    write('Play again? (yes/no): '),
    read(Ans),
    ( Ans == yes ->
        nl, play
    ; Ans == no ->
        write('👍 Thanks for playing!'), nl
    ;
        write('❓ Type yes or no.'), nl,
        ask_restart
    ).
