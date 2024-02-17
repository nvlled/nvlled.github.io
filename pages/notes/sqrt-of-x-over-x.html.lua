PAGE_TITLE = "sqrt(x)/x"
PAGE_DATE="2024-02-09 19:49"

return LAYOUT {
    PP [[
        The following text is my funny thought process
        where I mistook sqrt(x) = x⁻² instead of x^0.5 
    ]],
    HR,
    MD [[
I checked out sympy, a computer algebra system in python.
sqrt(x)/x does indeed simplify to 1/sqrt(x).
I'm doing it wrong I guess, I'm applying the algebraic
rules I learned from basic abstract algebra.
But sqrt(x) = x⁻² right?

| x.x = pow(x, 1+1)
|     = x²

| sqrt(x)sqrt(x) = x // why?
| (sqrt(x))²         // oh wait
makes sense

but why does this not work?
| x⁻²x⁻² =? x
| pow(x,-2+-2) =? x
| pow(x, -4) =? x

Does the negative exponent does not apply?

-----------

NOooo I'm fucking retarded AAHAH
sqrt(x) actually is x^0.5 NOT x^-2
x^-2 is 1/x^2 

Welp, at least the rules of algebra is consistent:

| (x^0.5)(x^0.5)
| = x^(0.5+0.5)
| = x

I was afraid exponents has special rules that I need
to memorize, but clearly that's not the case.

I see my error now.
| sqrt(x)/x
| = x^0.5/x
| = (x^0.5)(x^-1)
| = x^(0.5-1)
| = x^(-0.5)
| = 1/x^0.5
| = 1/sqrt(x)

Yay, I solved it without using math "tricks".
Sympy is actually pretty handy too, it can
check if two expressions are equal, very
useful when I'm doing braindead simplifications.
    ]]
}
