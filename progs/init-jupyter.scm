
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
        (string-split (eval-system "tm_kernelspecs") #\nl)
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
  (:session "Jupyter"))
