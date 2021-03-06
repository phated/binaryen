(module
 (memory 1 1)
 (import "env" "func" (func $import (result i64)))
 (func $defined (result i64)
  (i64.add (i64.const 1) (i64.const 2))
 )
 (func $unreachable-select-i64 (result i64)
  (select
   (i64.const 1)
   (unreachable)
   (i32.const 2)
  )
 )
 (func $unreachable-select-i64-b (result i64)
  (select
   (unreachable)
   (i64.const 3)
   (i32.const 4)
  )
 )
 (func $unreachable-select-i64-c (result i64)
  (select
   (i64.const 5)
   (i64.const 6)
   (unreachable)
  )
 )
 (func $mem
  (drop (i64.load align=8 (i32.const 0)))
  (drop (i64.load align=4 (i32.const 0)))
  (drop (i64.load align=2 (i32.const 0)))
  (drop (i64.load align=1 (i32.const 0)))
  (drop (i64.load          (i32.const 0)))
  (i64.store align=8 (i32.const 0) (i64.const 1))
  (i64.store align=4 (i32.const 0) (i64.const 2))
  (i64.store align=2 (i32.const 0) (i64.const 3))
  (i64.store align=1 (i32.const 0) (i64.const 4))
  (i64.store         (i32.const 0) (i64.const 5))
 )
)
(module
 (global $f (mut i64) (i64.const 0x12345678ABCDEFAF))
 (global $g (mut i64) (global.get $f))
 (func $call (param i64))
 (func "exp"
  (call $call (global.get $f))
  (global.set $f (i64.const 0x1122334455667788))
 )
 (func "unreach"
  (global.set $f
   (block $label$1 (result i64)
    (unreachable)
   )
  )
 )
)
(module
 (global $f (mut i64) (i64.const 0x12345678ABCDEFAF))
 (global $g (mut i64) (global.get $f))
 (func $call (param i64))
 (func "exp"
  (call $call (global.get $f))
  (global.set $f (i64.const 0x1122334455667788))
 )
)
(module
 (type $i64_f64_i32_=>_none (func (param i64 f64 i32)))
 (table $0 37 funcref)
 (func $0
  (call_indirect (type $i64_f64_i32_=>_none)
   (unreachable)
   (f64.const 1)
   (i32.const -32768)
   (i32.const 20)
  )
 )
)
