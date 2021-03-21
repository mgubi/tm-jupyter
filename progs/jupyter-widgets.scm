;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; MODULE      : jupyter-widgets.scm
;; DESCRIPTION : Widgets for the jupyter plugin
;; COPYRIGHT   : (C) 2014  Miguel de Benito Delgado
;;
;; This software falls under the GNU general public license version 3 or later.
;; It comes WITHOUT ANY WARRANTY WHATSOEVER. For details, see the file LICENSE
;; in the root directory or <http://www.gnu.org/licenses/gpl-3.0.html>.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(texmacs-module (jupyter-widgets)
  (:use (kernel gui menu-define) (kernel gui menu-widget)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; A very simple help widget.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define tmju-help-latex   "No object selected")

(define (tmju-help-content)
  `(with "bg-color" "#fdfdfd"
     (document
       (with "ornament-shape" "rounded" "ornament-color" "pastel yellow"
             "par-left" "2em" "par-right" "2em"
             (ornamented
              (document
                (concat (htab "5mm") (large (strong "Description")) 
                        (htab "5mm")))))
       (with "par-left" "1em" "par-right" "1em" ; ignored, why?
             ,tmju-help-latex))))

(tm-widget (tmju-help-widget close)
  (resize ("400px" "800px" "4000px") ("300px" "600px" "4000px")
    (refreshable "tmju-help-widget-content"
      (scrollable
        (texmacs-output 
         (stree->tree (tmju-help-content))
         '(style "generic"))))
    (bottom-buttons >>> ("Close" (close)))))

(tm-define (tmju-open-help text)
  (set! tmju-help-latex 
        (tree-ref (convert text "latex-document" "texmacs-tree") 2 0))
                                   ;(acons "verbatim->texmacs:wrap" "on" '())))
  (dialogue-window tmju-help-widget noop "Jupyters help"))

