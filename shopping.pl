
:- dynamic basket/1.

basket([coffee, milk, chocolate, apple, juice]).

display_items([]).
display_items([H|T]) :-
    writeln(H),
    display_items(T).

menu :-
    writeln('** SHOPPING LIST **'),
    writeln('d. display all items.'),
    writeln('a. Add an item to the list.'),
    writeln('e. exit.'),
    write('ENTER YOUR CHOICE: '),
    read(Choice),
    action(Choice).

action(d) :-
    basket(List),
    display_items(List),
    menu.

action(a) :-
    write('Enter the item you want to add: '),
    read(Item),
    retract(basket(List)),
    append(List, [Item], NewList),
    assertz(basket(NewList)),
    writeln('The item has been added'),
    menu.

action(e) :-
    writeln('Goodbye!').

action(_) :-
    writeln('Invalid choice'),
    menu.

start :-
    menu.
