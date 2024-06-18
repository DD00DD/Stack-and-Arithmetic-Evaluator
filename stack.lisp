(defstruct stack
  elements)


(defun create-stack ()
  (make-stack :elements (list))
)

(defun stack-push (stack element)
  (push element (stack-elements stack))
  stack)

(defun stack-pop (stack)
  (when (not (stack-empty? stack))
    (pop (stack-elements stack)))
)

(defun stack-top (stack)
  (when (not (stack-empty? stack))
    (car (stack-elements stack)))

)

(defun stack-empty? (stack)
  (equal (STACK-ELEMENTS stack) (list))
)
