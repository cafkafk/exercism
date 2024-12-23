triangle(A, B, C, T) :-
    A + B + C > 0,
    (
        A + B >= C,
        B + C >= A,
        A + C >= B
    ).
