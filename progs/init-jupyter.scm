
(define (jupyter-serialize lan t)
    (with u (pre-serialize lan t)
      (with s (texmacs->code (stree->tree u) "SourceCode")
        (string-append  s  "\n<EOF>\n"))))

(define (jupyter-launcher kernel)
  (let ((script (if (os-mingw?) "tm_jupyter.bat" "tm_jupyter") ))
    (if (!= kernel "") (string-append script " --kernel=" kernel)
      script)))

(plugin-configure jupyter
  (:require (url-exists-in-path? "python"))
  (:require (url-exists-in-path? "tm_jupyter"))
  (:require (url-exists-in-path? "tm_kernelspecs"))
  (:launch ,(jupyter-launcher ""))
  (:launch "julia-1.5" ,(jupyter-launcher "julia-1.5"))
  (:serializer ,jupyter-serialize)
  (:session "Jupyter"))
