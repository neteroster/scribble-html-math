#lang racket/base

(require scribble/core
         scribble/html-properties)

(require racket/string)

(provide math-setup
         math-inline
         math-display
         math-align)

(define mathjax3-source
  "https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js")

(define (math-setup)
  (paragraph
   (style #f
          (list (alt-tag "script")
                (attributes `((type . "text/javascript")
                              (src . ,mathjax3-source)))))
   '()))

(define (math-inline tex)
  (make-element #f (string-append "\\( " tex " \\)")))

(define (math-display tex)
  (make-element #f (string-append "\\[ " tex " \\]")))

(define (math-align . lines)
  (define lines-with-split
    (map (lambda (s)
           (cond [(string=? (string-trim s) "") ""]
                 [else (string-append s "\\\\")]))
         lines))
  
  (string-append "\\begin{align} "
                 (string-trim (apply string-append lines-with-split) "\\"
                              #:left? #f
                              #:repeat? #t)
                 " \\end{align}"))