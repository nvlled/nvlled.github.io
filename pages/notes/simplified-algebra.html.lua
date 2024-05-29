PAGE_TITLE = "Simplified Algebra"
PAGE_DATE = "2024-02-10 11:24"

return LAYOUT {
    H1 ^ EM ^ "TODO",

    PP [[
       In here are my notes about finding a simplified or consistent algebraic
       notation, in lieu of my last note.
    ]],
    UL {

        LI "no special syntax for exponents and roots",
        LI "divisions are expressed as multiplications and fractions",
        LI "subtractions are expressed as additions and negations",
        LI "all other operations and functions uses the same function syntax ",
        LI "terms or expressions can be freely reordered (since multiplication is commutative, fraction or division is not)",
        LI "fewer and simpler base set of \"rules\"",
    },


    H1 "Syntax",
    UL {
        LI "if omitted, two terms are multiplied together",
        LI "multiplication has higher precedence over addition",
        LI "spaces can be added between",
        LI "terms raised to -1 (e.g. 1/x) can be expressed by adding ~ at the end",
        LI "x^n = x*x*x...x (n times) ",
        LI "x^2 = x²",
        LI "x^3 = x³",
        LI "x~2 = 1/x²",
        LI "x~3 = 1/x³",
        LI "x~3 = 1/x³",
    },
    H1 "More Examples",
    UL {
        LI "ab c + d = (abc) + d",
        LI "1/x = x~",
        LI "2~ = 1/2 = 0.5",
        LI "sqrt(2) = 2~.5",
    }
}
