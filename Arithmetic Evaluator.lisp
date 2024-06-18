(defun factorial (n)
  (if (= n 0) 1
      (* n (factorial (- n 1)))))

(defun arith-eval (expr)
  "EXPR is a list of symbols that may include:
square brackets, arithmetic operations, and numbers."
  (let ((ops ())
        (vals ())
        (op nil)
        (val nil)
        (right 0)
        (left 0)
        )
      
    (dolist (item expr)
      (case item
        ([ (incf left))                            ; do nothing
        ((+ - * / ^ sdiv maxf fact) (push item ops))
        (] (setf op (pop ops) val (pop vals)) (incf right)
           (case op
             (+ (setf val (+ val (pop vals))))
             (- (setf val (- (pop vals) val)))
             (* (setf val (* val (pop vals))))
             (/ (setf val (/ (pop vals) val)))
             (^ (setf val (expt (pop vals) val)))
             (sdiv (setf val (/ (+ (- (pop vals)) (pop vals)) val)))
             (maxf (setf val (max val (pop vals) (pop vals))))
             (fact (setf val (factorial val))))
           (push val vals))
        (otherwise (push item vals)))
      )
    (if (= left right) (pop vals)
        nil)))


