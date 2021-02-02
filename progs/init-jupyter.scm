
(define (jupyter-serialize lan t)
    (with u (pre-serialize lan t)
      (with s (texmacs->code (stree->tree u) "SourceCode")
        (string-append  s  "\n<EOF>\n"))))

;(define jupyter-kernel "julia-1.5")
(define jupyter-kernel "")

(define (jupyter-launcher)
  (let ((script (if (os-mingw?) "tm_jupyter.bat" "tm_jupyter") ))
    (if (!= jupyter-kernel "") (string-append script " --kernel=" jupyter-kernel)
      script)))

(plugin-configure jupyter
  (:require (url-exists-in-path? "python"))
  (:require (url-exists-in-path? "tm_jupyter"))
  (:launch ,(jupyter-launcher))
  (:serializer ,jupyter-serialize)
  (:session "Jupyter")
  (:tab-completion #t))
