(define (treemergePrimes)
  (define (mltpls p)
    (define pm2 (* p 2))
    (let nxtmltpl ((cmpst (* p p)))
      (cons cmpst (lambda () (nxtmltpl (+ cmpst pm2))))))
  (define (allmltpls ps)
    (cons (mltpls (car ps)) (lambda () (allmltpls ((cdr ps))))))
  (define (merge xs ys)
    (let ((x (car xs)) (xt (cdr xs)) (y (car ys)) (yt (cdr ys)))
      (cond ((< x y) (cons x (lambda () (merge (xt) ys))))
            ((> x y) (cons y (lambda () (merge xs (yt)))))
            (else (cons x (lambda () (merge (xt) (yt))))))))
  (define (pairs mltplss)
    (let ((tl ((cdr mltplss))))
      (cons (merge (car mltplss) (car tl))
            (lambda () (pairs ((cdr tl)))))))
  (define (mrgmltpls mltplss)
    (cons (car (car mltplss))
          (lambda () (merge ((cdr (car mltplss)))
                            (mrgmltpls (pairs ((cdr mltplss))))))))
  (define (minusstrtat n cmps)
    (if (< n (car cmps))
      (cons n (lambda () (minusstrtat (+ n 2) cmps)))
      (minusstrtat (+ n 2) ((cdr cmps)))))
  (define (cmpsts) (mrgmltpls (allmltpls (oddprms)))) ;; internal define's are mutually recursive
  (define (oddprms) (cons 3 (lambda () (minusstrtat 5 (cmpsts)))))
  (cons 2 (lambda () (oddprms))))
