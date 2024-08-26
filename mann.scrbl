#lang scribble/manual

@(require (for-label racket/base "html-math.rkt" scribble/core))
@(require "html-math.rkt")

@(math-setup)

@title{html-math}

@author[(author+email "NeterOster" "neteroster@gmail.com")]

@defmodule["html-math.rkt" #:packages ()]

This library provides utilities for displaying math formulas in Scribble documents using @link["https://www.mathjax.org/"]{MathJax 3}.

@section{Setup}

Before using the functions provided in this library, you need to call @racket[math-setup] once in your document. This will include the MathJax 3 library from a CDN.

@defproc[(math-setup) void?]{
 Includes the MathJax 3 library from jsdelivr.net. This function should be called once at the beginning of your document.
}

@section{Inline Math}

@defproc[(math-inline [tex string?]) element?]{
 Creates an inline math element. The @racket[tex] argument should be a string containing the LaTeX code for the math formula.

 For example,                                    
 @codeblock|{
 #lang scribble/base
 
 @math-inline{E=mc^2} is a famous equation.
 }|
 produces

 @math-inline{E=mc^2} is a famous equation.

}

@section{Display Math}

@defproc[(math-display [tex string?]) element?]{
 Creates a display math element. The @racket[tex] argument should be a string containing the LaTeX code for the math formula.
                                     
 For example, 
 @codeblock|{
 #lang scribble/base
 
 @math-display{\sum_{i=1}^n i = \frac{n(n+1)}{2}}
 }|
 produces
 
 @(math-display "\\sum_{i=1}^n i = \\frac{n(n+1)}{2}")

}

@section{Aligned Math}

@defproc[(math-align [lines string?] ...) element?]{
 Creates an aligned math environment. Each argument is a line of LaTeX code, which will be aligned at the @litchar{&} character.

 For example,                                                                                                      
 @codeblock|{
 #lang scribble/base
 
 @math-align{f(x) &= (x+1)^2
                  &= x^2 + 2x + 1}
 }|
 produces
 
 @math-align{f(x) &= (x+1)^2
                  &= x^2 + 2x + 1}
}
