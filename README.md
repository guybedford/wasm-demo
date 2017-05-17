### Examples: Introduction to Web Assembly

Course examples from the Introduction to Web Assembly egghead.io course.

__Due to the use of ES Modules and WebGL 2, these demos are currently only supported in Chrome Canary with the Experimental JavaScript flag enabled from chrome://flags.__

1. [demo-js.html](demo-js.html): Introduction to the renderer.
2. [demo-wasm.html](demo-wasm.html): Used in the JS to WASM conversion step-by-step example.
3. [demo-js-coll.html](demo-js-coll.html): Includes collisions between circles.
4. [demo-wasm-coll.html](demo-wasm-coll.html): Used to compare performance between JS and WASM.
5. [demo-js-opt.html](demo-js-opt.html): Optimized grid-based collision algorithm.
6. [demo-wasm-opt.html](demo-wasm-opt.html): Web Assembly conversion demonstrating the faster-performing grid of linked-lists.

### Build

With the Web Assembly prerequisites installed and located in the path,
build can be run with `make`.

See the setup lessons for installing LLVM, Binaryen and WABT.

#### License

MIT
