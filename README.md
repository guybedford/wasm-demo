### Examples: Introduction to Web Assembly

Course examples from the Introduction to Web Assembly egghead.io course.

__Due to the use of ES Modules and WebGL 2, these demos are currently only supported in Chrome Canary with the Experimental JavaScript flag enabled from chrome://flags.__

1. [demo-js.html](https://embed.plnkr.co/FFN9MY6gcpnh3PPR0Qya?autoCloseSidebar=true): Introduction to the renderer.
2. [demo-wasm.html](https://embed.plnkr.co/V14384GNZsGtwZJZNt1O?autoCloseSidebar=true): Used in the JS to WASM conversion step-by-step example.
3. [demo-js-coll.html](https://embed.plnkr.co/DI8imAG2fpKwqqAMxqWS?autoCloseSidebar=true): Includes collisions between circles.
4. [demo-wasm-coll.html](https://embed.plnkr.co/cN4q3f6EdCCSpM8U1MV3?autoCloseSidebar=true): Used to compare performance between JS and WASM.
5. [demo-js-opt.html](https://embed.plnkr.co/HjBosWsN4YNi8M1cJt7h?autoCloseSidebar=true): Optimized grid-based collision algorithm.
6. [demo-wasm-opt.html](https://embed.plnkr.co/jsMi5oltGnT0Jn38js3v?autoCloseSidebar=true): Web Assembly conversion demonstrating the faster-performing grid of linked-lists.

### Build

With the Web Assembly prerequisites installed and located in the path,
build can be run with `make`.

See the setup lessons for installing LLVM, Binaryen and WABT.

#### License

MIT
