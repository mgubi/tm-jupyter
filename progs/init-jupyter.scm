
(define (jupyter-serialize lan t)
    (with u (pre-serialize lan t)
      (with s (texmacs->code (stree->tree u) "SourceCode")
        (string-append  s  "\n<EOF>\n"))))

(define (jupyter-launcher)
  (if (os-mingw?)
      "tm_jupyter.bat"
      "tm_jupyter"))

(plugin-configure jupyter
  (:require (url-exists-in-path? "python"))
  (:require (url-exists-in-path? "tm_jupyter"))
  (:launch ,(jupyter-launcher))
  (:serializer ,jupyter-serialize)
  (:session "Jupyter"))
