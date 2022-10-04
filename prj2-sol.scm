;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname prj2-sol) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct employee(name age department salary))
 (define employee1 (make-employee "tom" 33 "cs" 85000.00))
 (define employee2 (make-employee "bill" 29 "cs" 69500.00))
 (define employee3 (make-employee "sue" 19 "cs" 22000.00))
 (define employee4 (make-employee "joan" 23 "ecs" 110000.00))
 (define employee5 (make-employee "max" 29 "eee" 55000.00))
 (define employee6 (make-employee "nick" 27 "ecs" 80000.00))

(define lst1 (list (employee-name employee1)
                    (employee-name employee1) (employee-name employee2)
                    (employee-name employee3) (employee-name employee4)
                    (employee-name employee5) (employee-name employee6)))
 (cdr lst1)

 ;;;1
 (define (dept-employees dept employees) 
(if (not (empty? employees)) 
(cons ((lambda (c) (if (equal? dept (list-ref c 2)) c '())) (first employees)) 
(dept-employees dept (rest employees))) '())) 

 ;;2
(define lst1 (list (employee-name employee1)
                    (employee-name employee1) (employee-name employee2)
                    (employee-name employee3) (employee-name employee4)
                    (employee-name employee5) (employee-name employee6)))
(define lst2 (list (employee-salary employee1)
                    (employee-salary employee1) (employee-salary employee2)
                    (employee-salary employee3) (employee-salary employee4)
                    (employee-salary employee5) (employee-salary employee6)))

(define my-append
  (lambda (lst1 lst2)
     (if (null? lst1)
         lst2
         (cons (car lst1) (my-append (cdr lst1)
				      lst2)))))

 ;;3
#lang racket
(define get-nth
  (lambda (index lst3)
      (cond 
        ((empty? lst3) #f)
        ((= index 0) (car lst3))
        (else (get-nth (- index 1) (cdr lst3))))))

 ;;4
(define lst2 (list (employee-salary employee1)
                    (employee-salary employee1) (employee-salary employee2)
                    (employee-salary employee3) (employee-salary employee4)
                    (employee-salary employee5) (employee-salary employee6)))
 (cdr lst2)
(/( apply + (cdr lst2))6)

 ;;5
define (dept-employees-names-salaries dept employees)
 (map (lambda (c) (list (list-ref c 0) (list-ref c 3))) 
(filter (lambda (c) (equal? dept (list-ref c 2))) employees))) 


 ;;6
 (define lst2 (list (employee-salary employee1)
                    (employee-salary employee1) (employee-salary employee2)
                    (employee-salary employee3) (employee-salary employee4)
                    (employee-salary employee5) (employee-salary employee6)))
 (/(foldr + 0 (cdr lst2))6) 

 ;;7
(require picturing-programs)
(define List3
  (list 9 ( list 8 7 (list 6) "hi")
        4 (list 3 2) pic:hacker))
;;list?:any->boolean
;;Is x a list?
(check-expect (list? 7)false)
(check-expect (list? (list7))true)
(define (list1 ? x) (cons? x))

(check-expect(flatten 5)(list 5))
(check-expect(flatten (list 4 3))(list 4 3))
(check-expect(flatten(list 5(list 4 3)))(list 5 4 3))
(define (flatten L)
  (cond
    [(list? L) (apply append (map flatten L))]
    [else (list L)]))

