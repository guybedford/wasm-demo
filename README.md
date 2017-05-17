### Examples: Introduction to Web Assembly

Course examples from the Introduction to Web Assembly egghead.io course.

__Due to the use of ES Modules and WebGL 2, these demos are currently only supported in Chrome Canary with the Experimental JavaScript flag enabled from chrome://flags.__

1. [demo-js.html](https://plnkr.co/edit/FFN9MY6gcpnh3PPR0Qya?p=preview): Introduction to the renderer.
2. [demo-wasm.html](https://plnkr.co/edit/V14384GNZsGtwZJZNt1O?p=preview): Used in the JS to WASM conversion step-by-step example.
3. [demo-js-coll.html](https://plnkr.co/edit/DI8imAG2fpKwqqAMxqWS?p=preview): Includes collisions between circles.
4. [demo-wasm-coll.html](https://plnkr.co/edit/cN4q3f6EdCCSpM8U1MV3?p=preview): Used to compare performance between JS and WASM.
5. [demo-js-opt.html](https://plnkr.co/edit/HjBosWsN4YNi8M1cJt7h?p=preview): Optimized grid-based collision algorithm.
6. [demo-wasm-opt.html](https://plnkr.co/edit/jsMi5oltGnT0Jn38js3v?p=preview): Web Assembly conversion demonstrating the faster-performing grid of linked-lists.

### Build

With the Web Assembly prerequisites installed and located in the path,
build can be run with `make`.

See the setup lessons for installing LLVM, Binaryen and WABT.

#### License

MIT
