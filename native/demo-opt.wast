(module
 (type $FUNCSIG$ff (func (param f32) (result f32)))
 (type $FUNCSIG$f (func (result f32)))
 (import "env" "expf" (func $expf (param f32) (result f32)))
 (import "env" "randomf" (func $randomf (result f32)))
 (table 0 anyfunc)
 (memory $0 17)
 (export "memory" (memory $0))
 (export "getCircleCount" (func $getCircleCount))
 (export "getCircleDataOffset" (func $getCircleDataOffset))
 (export "detectCircleCollision" (func $detectCircleCollision))
 (export "init" (func $init))
 (export "timeStep" (func $timeStep))
 (func $getCircleCount (result i32)
  (i32.const 20000)
 )
 (func $getCircleDataOffset (result i32)
  (i32.const 16)
 )
 (func $detectCircleCollision (param $0 f32) (param $1 f32) (param $2 f32) (param $3 f32) (param $4 f32) (param $5 f32) (result i32)
  (local $6 i32)
  (set_local $6
   (i32.const 0)
  )
  (block $label$0
   (br_if $label$0
    (f32.lt
     (f32.add
      (get_local $0)
      (get_local $2)
     )
     (f32.sub
      (get_local $3)
      (get_local $5)
     )
    )
   )
   (br_if $label$0
    (f32.gt
     (f32.sub
      (get_local $0)
      (get_local $2)
     )
     (f32.add
      (get_local $3)
      (get_local $5)
     )
    )
   )
   (br_if $label$0
    (f32.lt
     (f32.add
      (get_local $1)
      (get_local $2)
     )
     (f32.sub
      (get_local $4)
      (get_local $5)
     )
    )
   )
   (br_if $label$0
    (f32.gt
     (f32.sub
      (get_local $1)
      (get_local $2)
     )
     (f32.add
      (get_local $4)
      (get_local $5)
     )
    )
   )
   (set_local $6
    (f32.le
     (f32.sqrt
      (f32.add
       (f32.mul
        (tee_local $0
         (f32.sub
          (get_local $3)
          (get_local $0)
         )
        )
        (get_local $0)
       )
       (f32.mul
        (tee_local $0
         (f32.sub
          (get_local $4)
          (get_local $1)
         )
        )
        (get_local $0)
       )
      )
     )
     (f32.add
      (get_local $2)
      (get_local $5)
     )
    )
   )
  )
  (get_local $6)
 )
 (func $init (param $0 f32) (param $1 f32)
  (local $2 f32)
  (local $3 f32)
  (local $4 f32)
  (local $5 i32)
  (local $6 i32)
  (local $7 f32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (set_local $8
   (i32.const 0)
  )
  (block $label$0
   (loop $label$1
    (br_if $label$0
     (i32.eq
      (get_local $8)
      (i32.const 20000)
     )
    )
    (loop $label$2
     (set_local $7
      (call $randomf)
     )
     (set_local $3
      (call $randomf)
     )
     (set_local $7
      (f32.sub
       (get_local $0)
       (f32.add
        (tee_local $2
         (f32.mul
          (get_local $7)
          (get_local $0)
         )
        )
        (tee_local $4
         (f32.ceil
          (f32.demote/f64
           (f64.div
            (f64.promote/f32
             (call $expf
              (f32.mul
               (call $randomf)
               (f32.const 8)
              )
             )
            )
            (f64.const 23.2887)
           )
          )
         )
        )
       )
      )
     )
     (br_if $label$2
      (f32.lt
       (f32.sub
        (get_local $2)
        (get_local $4)
       )
       (f32.const 0)
      )
     )
     (set_local $3
      (f32.mul
       (get_local $3)
       (get_local $1)
      )
     )
     (br_if $label$2
      (f32.lt
       (get_local $7)
       (f32.const 0)
      )
     )
     (set_local $7
      (f32.sub
       (get_local $1)
       (f32.add
        (get_local $3)
        (get_local $4)
       )
      )
     )
     (br_if $label$2
      (f32.lt
       (f32.sub
        (get_local $3)
        (get_local $4)
       )
       (f32.const 0)
      )
     )
     (br_if $label$2
      (f32.lt
       (get_local $7)
       (f32.const 0)
      )
     )
     (set_local $10
      (i32.const 16)
     )
     (set_local $9
      (i32.const -1)
     )
     (block $label$3
      (loop $label$4
       (br_if $label$3
        (i32.ge_s
         (tee_local $9
          (i32.add
           (get_local $9)
           (i32.const 1)
          )
         )
         (get_local $8)
        )
       )
       (set_local $5
        (i32.add
         (get_local $10)
         (i32.const 8)
        )
       )
       (set_local $6
        (i32.add
         (get_local $10)
         (i32.const 4)
        )
       )
       (set_local $7
        (f32.load
         (get_local $10)
        )
       )
       (set_local $10
        (i32.add
         (get_local $10)
         (i32.const 12)
        )
       )
       (br_if $label$4
        (i32.eqz
         (call $detectCircleCollision
          (get_local $2)
          (get_local $3)
          (get_local $4)
          (get_local $7)
          (f32.load
           (get_local $6)
          )
          (f32.load
           (get_local $5)
          )
         )
        )
       )
       (br $label$2)
      )
     )
    )
    (f32.store
     (i32.add
      (tee_local $10
       (i32.mul
        (get_local $8)
        (i32.const 12)
       )
      )
      (i32.const 20)
     )
     (get_local $3)
    )
    (f32.store
     (i32.add
      (get_local $10)
      (i32.const 16)
     )
     (get_local $2)
    )
    (f32.store
     (i32.add
      (get_local $10)
      (i32.const 24)
     )
     (get_local $4)
    )
    (f32.store
     (i32.add
      (tee_local $10
       (i32.shl
        (get_local $8)
        (i32.const 3)
       )
      )
      (i32.const 240016)
     )
     (f32.demote/f64
      (f64.mul
       (f64.add
        (f64.promote/f32
         (call $randomf)
        )
        (f64.const -0.5)
       )
       (f64.const 0.1)
      )
     )
    )
    (f32.store
     (i32.add
      (get_local $10)
      (i32.const 240020)
     )
     (f32.demote/f64
      (f64.mul
       (f64.add
        (f64.promote/f32
         (call $randomf)
        )
        (f64.const -0.5)
       )
       (f64.const 0.1)
      )
     )
    )
    (set_local $8
     (i32.add
      (get_local $8)
      (i32.const 1)
     )
    )
    (br $label$1)
   )
  )
 )
 (func $timeStep (param $0 f32) (param $1 f32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 f32)
  (local $7 f32)
  (local $8 f32)
  (local $9 i32)
  (local $10 f32)
  (local $11 i32)
  (local $12 f32)
  (local $13 i32)
  (local $14 f32)
  (local $15 f32)
  (local $16 f32)
  (local $17 f32)
  (local $18 f32)
  (local $19 f32)
  (local $20 f64)
  (local $21 i32)
  (local $22 f32)
  (local $23 f32)
  (local $24 i32)
  (local $25 i32)
  (set_local $21
   (i32.const 400016)
  )
  (set_local $13
   (i32.const 0)
  )
  (block $label$0
   (loop $label$1
    (br_if $label$0
     (i32.eq
      (get_local $13)
      (i32.const 70)
     )
    )
    (set_local $25
     (i32.const 0)
    )
    (block $label$2
     (loop $label$3
      (br_if $label$2
       (i32.eq
        (get_local $25)
        (i32.const 480)
       )
      )
      (i32.store
       (i32.add
        (get_local $21)
        (get_local $25)
       )
       (i32.const 0)
      )
      (set_local $25
       (i32.add
        (get_local $25)
        (i32.const 4)
       )
      )
      (br $label$3)
     )
    )
    (set_local $21
     (i32.add
      (get_local $21)
      (i32.const 480)
     )
    )
    (set_local $13
     (i32.add
      (get_local $13)
      (i32.const 1)
     )
    )
    (br $label$1)
   )
  )
  (set_local $5
   (i32.const 0)
  )
  (set_local $11
   (i32.const 0)
  )
  (block $label$4
   (loop $label$5
    (br_if $label$4
     (i32.eq
      (get_local $5)
      (i32.const 20000)
     )
    )
    (set_local $10
     (f32.add
      (tee_local $15
       (f32.load
        (tee_local $21
         (i32.add
          (tee_local $25
           (i32.mul
            (get_local $5)
            (i32.const 12)
           )
          )
          (i32.const 16)
         )
        )
       )
      )
      (tee_local $7
       (f32.load
        (i32.add
         (get_local $25)
         (i32.const 24)
        )
       )
      )
     )
    )
    (set_local $6
     (f32.load
      (tee_local $25
       (i32.add
        (get_local $25)
        (i32.const 20)
       )
      )
     )
    )
    (set_local $20
     (f64.add
      (f64.promote/f32
       (f32.load
        (tee_local $9
         (i32.add
          (tee_local $13
           (i32.shl
            (get_local $5)
            (i32.const 3)
           )
          )
          (i32.const 240020)
         )
        )
       )
      )
      (f64.const 0.0001)
     )
    )
    (block $label$6
     (block $label$7
      (block $label$8
       (br_if $label$8
        (i32.or
         (f32.le
          (tee_local $16
           (f32.load
            (tee_local $13
             (i32.add
              (get_local $13)
              (i32.const 240016)
             )
            )
           )
          )
          (f32.const 0)
         )
         (tee_local $24
          (f32.ne
           (get_local $16)
           (get_local $16)
          )
         )
        )
       )
       (br_if $label$7
        (f32.lt
         (f32.sub
          (get_local $0)
          (get_local $10)
         )
         (f32.const 0)
        )
       )
      )
      (br_if $label$6
       (i32.or
        (f32.ge
         (tee_local $8
          (f32.sub
           (get_local $15)
           (get_local $7)
          )
         )
         (f32.const 0)
        )
        (f32.ne
         (get_local $8)
         (get_local $8)
        )
       )
      )
      (br_if $label$6
       (i32.or
        (f32.ge
         (get_local $16)
         (f32.const 0)
        )
        (get_local $24)
       )
      )
     )
     (set_local $16
      (f32.neg
       (get_local $16)
      )
     )
    )
    (set_local $8
     (f32.demote/f64
      (get_local $20)
     )
    )
    (set_local $14
     (f32.sub
      (get_local $6)
      (get_local $7)
     )
    )
    (block $label$9
     (block $label$10
      (block $label$11
       (br_if $label$11
        (i32.or
         (f32.ge
          (tee_local $19
           (f32.sub
            (get_local $1)
            (tee_local $17
             (f32.add
              (get_local $6)
              (get_local $7)
             )
            )
           )
          )
          (f32.const 0)
         )
         (f32.ne
          (get_local $19)
          (get_local $19)
         )
        )
       )
       (br_if $label$10
        (f32.gt
         (get_local $8)
         (f32.const 0)
        )
       )
      )
      (br_if $label$9
       (i32.or
        (f32.ge
         (get_local $14)
         (f32.const 0)
        )
        (f32.ne
         (get_local $14)
         (get_local $14)
        )
       )
      )
      (br_if $label$9
       (i32.or
        (f32.ge
         (get_local $8)
         (f32.const 0)
        )
        (f32.ne
         (get_local $8)
         (get_local $8)
        )
       )
      )
     )
     (set_local $8
      (f32.neg
       (get_local $8)
      )
     )
    )
    (f32.store
     (get_local $13)
     (get_local $16)
    )
    (f32.store
     (get_local $9)
     (get_local $8)
    )
    (f32.store
     (get_local $25)
     (f32.add
      (get_local $6)
      (get_local $8)
     )
    )
    (f32.store
     (get_local $21)
     (f32.add
      (get_local $15)
      (get_local $16)
     )
    )
    (set_local $4
     (i32.add
      (i32.add
       (i32.mul
        (tee_local $24
         (select
          (tee_local $25
           (i32.trunc_s/f32
            (f32.floor
             (f32.mul
              (f32.div
               (f32.sub
                (get_local $15)
                (get_local $7)
               )
               (get_local $0)
              )
              (f32.const 70)
             )
            )
           )
          )
          (i32.const 0)
          (i32.gt_s
           (get_local $25)
           (i32.const 0)
          )
         )
        )
        (i32.const 480)
       )
       (i32.shl
        (tee_local $3
         (select
          (tee_local $25
           (i32.trunc_s/f32
            (f32.floor
             (f32.mul
              (f32.div
               (get_local $14)
               (get_local $1)
              )
              (f32.const 120)
             )
            )
           )
          )
          (i32.const 0)
          (i32.gt_s
           (get_local $25)
           (i32.const 0)
          )
         )
        )
        (i32.const 2)
       )
      )
      (i32.const 400016)
     )
    )
    (set_local $9
     (select
      (tee_local $25
       (i32.trunc_s/f32
        (f32.floor
         (f32.mul
          (f32.div
           (get_local $17)
           (get_local $1)
          )
          (f32.const 120)
         )
        )
       )
      )
      (i32.const 119)
      (i32.lt_s
       (get_local $25)
       (i32.const 119)
      )
     )
    )
    (set_local $2
     (select
      (tee_local $25
       (i32.trunc_s/f32
        (f32.floor
         (f32.mul
          (f32.div
           (get_local $10)
           (get_local $0)
          )
          (f32.const 70)
         )
        )
       )
      )
      (i32.const 69)
      (i32.lt_s
       (get_local $25)
       (i32.const 69)
      )
     )
    )
    (block $label$12
     (loop $label$13
      (br_if $label$12
       (i32.gt_s
        (get_local $24)
        (get_local $2)
       )
      )
      (set_local $25
       (i32.add
        (i32.shl
         (get_local $11)
         (i32.const 3)
        )
        (i32.const 433616)
       )
      )
      (set_local $21
       (get_local $4)
      )
      (set_local $13
       (get_local $3)
      )
      (block $label$14
       (loop $label$15
        (br_if $label$14
         (i32.gt_s
          (get_local $13)
          (get_local $9)
         )
        )
        (i32.store
         (i32.add
          (get_local $25)
          (i32.const 4)
         )
         (i32.load
          (get_local $21)
         )
        )
        (i32.store
         (get_local $25)
         (get_local $5)
        )
        (i32.store
         (get_local $21)
         (get_local $25)
        )
        (set_local $25
         (i32.add
          (get_local $25)
          (i32.const 8)
         )
        )
        (set_local $21
         (i32.add
          (get_local $21)
          (i32.const 4)
         )
        )
        (set_local $13
         (i32.add
          (get_local $13)
          (i32.const 1)
         )
        )
        (set_local $11
         (i32.add
          (get_local $11)
          (i32.const 1)
         )
        )
        (br $label$15)
       )
      )
      (set_local $4
       (i32.add
        (get_local $4)
        (i32.const 480)
       )
      )
      (set_local $24
       (i32.add
        (get_local $24)
        (i32.const 1)
       )
      )
      (br $label$13)
     )
    )
    (set_local $5
     (i32.add
      (get_local $5)
      (i32.const 1)
     )
    )
    (br $label$5)
   )
  )
  (set_local $4
   (i32.const 0)
  )
  (block $label$16
   (loop $label$17
    (br_if $label$16
     (i32.eq
      (get_local $4)
      (i32.const 70)
     )
    )
    (set_local $24
     (i32.const 0)
    )
    (block $label$18
     (loop $label$19
      (br_if $label$18
       (i32.eq
        (get_local $24)
        (i32.const 120)
       )
      )
      (set_local $25
       (i32.add
        (i32.add
         (i32.mul
          (get_local $4)
          (i32.const 480)
         )
         (i32.shl
          (get_local $24)
          (i32.const 2)
         )
        )
        (i32.const 400016)
       )
      )
      (block $label$20
       (loop $label$21
        (br_if $label$20
         (i32.eqz
          (tee_local $5
           (i32.load
            (get_local $25)
           )
          )
         )
        )
        (set_local $0
         (f32.load
          (tee_local $11
           (i32.add
            (tee_local $21
             (i32.shl
              (tee_local $25
               (i32.load
                (get_local $5)
               )
              )
              (i32.const 3)
             )
            )
            (i32.const 240020)
           )
          )
         )
        )
        (set_local $10
         (f32.load
          (tee_local $9
           (i32.add
            (get_local $21)
            (i32.const 240016)
           )
          )
         )
        )
        (set_local $7
         (f32.load
          (i32.add
           (tee_local $25
            (i32.mul
             (get_local $25)
             (i32.const 12)
            )
           )
           (i32.const 20)
          )
         )
        )
        (set_local $6
         (f32.load
          (i32.add
           (get_local $25)
           (i32.const 16)
          )
         )
        )
        (set_local $12
         (f32.add
          (tee_local $8
           (f32.load
            (i32.add
             (get_local $25)
             (i32.const 24)
            )
           )
          )
          (get_local $8)
         )
        )
        (set_local $25
         (get_local $5)
        )
        (block $label$22
         (loop $label$23
          (br_if $label$22
           (i32.eqz
            (tee_local $25
             (i32.load offset=4
              (get_local $25)
             )
            )
           )
          )
          (br_if $label$23
           (i32.eqz
            (call $detectCircleCollision
             (get_local $6)
             (get_local $7)
             (get_local $8)
             (tee_local $14
              (f32.load
               (i32.add
                (tee_local $21
                 (i32.mul
                  (tee_local $13
                   (i32.load
                    (get_local $25)
                   )
                  )
                  (i32.const 12)
                 )
                )
                (i32.const 16)
               )
              )
             )
             (tee_local $15
              (f32.load
               (i32.add
                (get_local $21)
                (i32.const 20)
               )
              )
             )
             (tee_local $16
              (f32.load
               (i32.add
                (get_local $21)
                (i32.const 24)
               )
              )
             )
            )
           )
          )
          (br_if $label$23
           (f32.le
            (f32.sub
             (tee_local $1
              (f32.add
               (f32.mul
                (get_local $10)
                (tee_local $15
                 (f32.div
                  (tee_local $14
                   (f32.sub
                    (get_local $14)
                    (get_local $6)
                   )
                  )
                  (tee_local $1
                   (f32.sqrt
                    (f32.add
                     (f32.mul
                      (get_local $14)
                      (get_local $14)
                     )
                     (f32.mul
                      (tee_local $14
                       (f32.sub
                        (get_local $15)
                        (get_local $7)
                       )
                      )
                      (get_local $14)
                     )
                    )
                   )
                  )
                 )
                )
               )
               (f32.mul
                (get_local $0)
                (tee_local $14
                 (f32.div
                  (get_local $14)
                  (get_local $1)
                 )
                )
               )
              )
             )
             (tee_local $19
              (f32.add
               (f32.mul
                (tee_local $17
                 (f32.load
                  (tee_local $13
                   (i32.add
                    (tee_local $21
                     (i32.shl
                      (get_local $13)
                      (i32.const 3)
                     )
                    )
                    (i32.const 240016)
                   )
                  )
                 )
                )
                (get_local $15)
               )
               (f32.mul
                (tee_local $18
                 (f32.load
                  (tee_local $21
                   (i32.add
                    (get_local $21)
                    (i32.const 240020)
                   )
                  )
                 )
                )
                (get_local $14)
               )
              )
             )
            )
            (f32.const 0)
           )
          )
          (f32.store
           (get_local $11)
           (f32.add
            (get_local $0)
            (f32.mul
             (get_local $14)
             (tee_local $23
              (f32.sub
               (f32.div
                (f32.add
                 (f32.mul
                  (tee_local $22
                   (f32.sub
                    (get_local $8)
                    (get_local $16)
                   )
                  )
                  (get_local $1)
                 )
                 (f32.mul
                  (f32.add
                   (get_local $16)
                   (get_local $16)
                  )
                  (get_local $19)
                 )
                )
                (tee_local $16
                 (f32.add
                  (get_local $8)
                  (get_local $16)
                 )
                )
               )
               (get_local $1)
              )
             )
            )
           )
          )
          (f32.store
           (get_local $9)
           (f32.add
            (get_local $10)
            (f32.mul
             (get_local $15)
             (get_local $23)
            )
           )
          )
          (f32.store
           (get_local $21)
           (f32.add
            (get_local $18)
            (f32.mul
             (get_local $14)
             (tee_local $16
              (f32.sub
               (f32.div
                (f32.sub
                 (f32.mul
                  (get_local $12)
                  (get_local $1)
                 )
                 (f32.mul
                  (get_local $22)
                  (get_local $19)
                 )
                )
                (get_local $16)
               )
               (get_local $19)
              )
             )
            )
           )
          )
          (f32.store
           (get_local $13)
           (f32.add
            (get_local $17)
            (f32.mul
             (get_local $15)
             (get_local $16)
            )
           )
          )
          (br $label$23)
         )
        )
        (set_local $25
         (i32.add
          (get_local $5)
          (i32.const 4)
         )
        )
        (br $label$21)
       )
      )
      (set_local $24
       (i32.add
        (get_local $24)
        (i32.const 1)
       )
      )
      (br $label$19)
     )
    )
    (set_local $4
     (i32.add
      (get_local $4)
      (i32.const 1)
     )
    )
    (br $label$17)
   )
  )
 )
)
