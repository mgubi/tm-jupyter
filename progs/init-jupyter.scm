;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; MODULE      : init-jupyter.scm
;; DESCRIPTION : Initialize Jupyter plugin
;; COPYRIGHT   : (C) 2019  Massimiliano Gubinelli
;; COPYRIGHT   : (C) 2021  Jeroen Wouters
;;
;; This software falls under the GNU general public license version 3 or later.
;; It comes WITHOUT ANY WARRANTY WHATSOEVER. For details, see the file LICENSE
;; in the root directory or <http://www.gnu.org/licenses/gpl-3.0.html>.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (jupyter-serialize lan t)
    (with u (pre-serialize lan t)
      (with s (texmacs->code (stree->tree u) "SourceCode")
        (string-append  s  "\n<EOF>\n"))))

(define (jupyter-launcher kernel)
  (let ((script (if (os-mingw?) "tm_jupyter.bat" "tm_jupyter") ))
    (if (!= kernel "") (string-append script " --kernel=" kernel)
      script)))

(define (jupyter-launchers)
    (map (lambda (u) `(:launch ,u ,(jupyter-launcher u)))
      (filter (lambda (k) (!= "" k))
        (string-split (eval-system "tm_kernelspecs") #\newline)
      )
    )
)

(plugin-configure jupyter
  (:require (url-exists-in-path? "python"))
  (:require (url-exists-in-path? "tm_jupyter"))
  (:require (url-exists-in-path? "tm_kernelspecs"))
  (:launch ,(jupyter-launcher ""))
  ,@(jupyter-launchers)
  (:serializer ,jupyter-serialize)
  (:session "Jupyter")
  (:tab-completion #t))

(when (supports-jupyter?)
  (import-from (jupyter-widgets)))
