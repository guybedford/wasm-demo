(module
 (type $FUNCSIG$f (func (result f32)))
 (import "env" "randomf" (func $randomf (result f32)))
 (table 0 anyfunc)
 (memory $0 1)
 (export "memory" (memory $0))
 (export "getCircleCount" (func $getCircleCount))
 (export "getCircleDataOffset" (func $getCircleDataOffset))
 (export "init" (func $init))
 (export "timeStep" (func $timeStep))
 (func $getCircleCount (result i32)
  (i32.const 1000)
 )
 (func $getCircleDataOffset (result i32)
  (i32.const 16)
 )
 (func $init (param $0 f32) (param $1 f32)
  (local $2 f32)
  (local $3 i32)
  (local $4 i32)
  (set_local $4
   (i32.const -8000)
  )
  (set_local $3
   (i32.const 16)
  )
  (block $label$0
   (loop $label$1
    (br_if $label$0
     (i32.eqz
      (get_local $4)
     )
    )
    (f32.store
     (get_local $3)
     (f32.mul
      (call $randomf)
      (get_local $0)
     )
    )
    (set_local $2
     (call $randomf)
    )
    (i32.store
     (i32.add
      (get_local $3)
      (i32.const 8)
     )
     (i32.const 1084227584)
    )
    (f32.store
     (i32.add
      (get_local $3)
      (i32.const 4)
     )
     (f32.mul
      (get_local $2)
      (get_local $1)
     )
    )
    (f32.store
     (i32.add
      (get_local $4)
      (i32.const 20016)
     )
     (f32.demote/f64
      (f64.mul
       (f64.add
        (f64.promote/f32
         (call $randomf)
        )
        (f64.const -0.5)
       )
       (f64.const 0.01)
      )
     )
    )
    (f32.store
     (i32.add
      (get_local $4)
      (i32.const 20020)
     )
     (f32.demote/f64
      (f64.mul
       (f64.add
        (f64.promote/f32
         (call $randomf)
        )
        (f64.const -0.5)
       )
       (f64.const 0.01)
      )
     )
    )
    (set_local $3
     (i32.add
      (get_local $3)
      (i32.const 12)
     )
    )
    (set_local $4
     (i32.add
      (get_local $4)
      (i32.const 8)
     )
    )
    (br $label$1)
   )
  )
 )
 (func $timeStep (param $0 f32) (param $1 f32)
  (local $2 f32)
  (local $3 f32)
  (local $4 f32)
  (local $5 f32)
  (local $6 f32)
  (local $7 i32)
  (local $8 i32)
  (local $9 f32)
  (local $10 i32)
  (local $11 i32)
  (set_local $11
   (i32.const -8000)
  )
  (set_local $10
   (i32.const 16)
  )
  (block $label$0
   (loop $label$1
    (br_if $label$0
     (i32.eqz
      (get_local $11)
     )
    )
    (f32.store
     (get_local $10)
     (f32.add
      (tee_local $2
       (f32.load
        (get_local $10)
       )
      )
      (tee_local $5
       (f32.load
        (tee_local $7
         (i32.add
          (get_local $11)
          (i32.const 20016)
         )
        )
       )
      )
     )
    )
    (f32.store
     (tee_local $8
      (i32.add
       (get_local $10)
       (i32.const 4)
      )
     )
     (f32.add
      (tee_local $3
       (f32.load
        (get_local $8)
       )
      )
      (tee_local $6
       (f32.load
        (tee_local $8
         (i32.add
          (get_local $11)
          (i32.const 20020)
         )
        )
       )
      )
     )
    )
    (block $label$2
     (block $label$3
      (block $label$4
       (br_if $label$4
        (i32.or
         (f32.le
          (tee_local $9
           (f32.add
            (get_local $2)
            (tee_local $4
             (f32.load
              (i32.add
               (get_local $10)
               (i32.const 8)
              )
             )
            )
           )
          )
          (get_local $0)
         )
         (i32.or
          (f32.ne
           (get_local $9)
           (get_local $9)
          )
          (f32.ne
           (get_local $0)
           (get_local $0)
          )
         )
        )
       )
       (br_if $label$3
        (f32.gt
         (get_local $5)
         (f32.const 0)
        )
       )
      )
      (br_if $label$2
       (i32.or
        (f32.ge
         (tee_local $9
          (f32.sub
           (get_local $2)
           (get_local $4)
          )
         )
         (f32.const 0)
        )
        (f32.ne
         (get_local $9)
         (get_local $9)
        )
       )
      )
      (br_if $label$2
       (i32.or
        (f32.ge
         (get_local $5)
         (f32.const 0)
        )
        (f32.ne
         (get_local $5)
         (get_local $5)
        )
       )
      )
     )
     (f32.store
      (get_local $7)
      (f32.neg
       (get_local $5)
      )
     )
    )
    (block $label$5
     (block $label$6
      (block $label$7
       (br_if $label$7
        (i32.or
         (f32.le
          (tee_local $5
           (f32.add
            (get_local $3)
            (get_local $4)
           )
          )
          (get_local $1)
         )
         (i32.or
          (f32.ne
           (get_local $5)
           (get_local $5)
          )
          (f32.ne
           (get_local $1)
           (get_local $1)
          )
         )
        )
       )
       (br_if $label$6
        (f32.gt
         (get_local $6)
         (f32.const 0)
        )
       )
      )
      (br_if $label$5
       (i32.or
        (f32.ge
         (tee_local $5
          (f32.sub
           (get_local $3)
           (get_local $4)
          )
         )
         (f32.const 0)
        )
        (f32.ne
         (get_local $5)
         (get_local $5)
        )
       )
      )
      (br_if $label$5
       (i32.or
        (f32.ge
         (get_local $6)
         (f32.const 0)
        )
        (f32.ne
         (get_local $6)
         (get_local $6)
        )
       )
      )
     )
     (f32.store
      (get_local $8)
      (f32.neg
       (get_local $6)
      )
     )
    )
    (set_local $10
     (i32.add
      (get_local $10)
      (i32.const 12)
     )
    )
    (set_local $11
     (i32.add
      (get_local $11)
      (i32.const 8)
     )
    )
    (br $label$1)
   )
  )
 )
)
