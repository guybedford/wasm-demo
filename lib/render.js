export default function initRender (circleFloat32Array, circleCount, init = () => {}, timeStep = () => {}) {
  const gl = canvas.getContext('webgl2');

  /*
   * Program and shaders
   */
  const program = gl.createProgram();
  function compileShader (gl, shaderType, shaderSource) {
    const shader = gl.createShader(shaderType);
    gl.shaderSource(shader, shaderSource);
    gl.compileShader(shader);
    if (!gl.getShaderParameter(shader, gl.COMPILE_STATUS))
      throw new Error('Could not compile shader: ' + gl.getShaderInfoLog(shader));
    return shader;
  }
  gl.attachShader(program, compileShader(gl, gl.VERTEX_SHADER, `#version 300 es
    in vec3 circleCoord;
    uniform vec2 u_resolution;
    out float size;
    void main () {
      // convert pixel space to clip space (-1, 1 ranges, flipped y axis)
      // (https://www.html5rocks.com/en/tutorials/webgl/webgl_fundamentals/)
      vec2 circle = circleCoord.xy / u_resolution * vec2(2, -2) - vec2(1, -1);
      gl_Position = vec4(circle, 0, 1);
      // set circle size from z coord of circleCoord (gl.POINT render option)
      gl_PointSize = size = circleCoord.z * 2.0 + 1.0;
    }
  `));
  gl.attachShader(program, compileShader(gl, gl.FRAGMENT_SHADER, `#version 300 es
    precision mediump float;
    in float size;
    out vec4 outColor;
    void main () {
      // distance from center circle circle to current fragment coordinate
      // gl_PointCoord is just for gl.POINT renders, returning (0-1, 0-1) position from circle
      float dist = length(gl_PointCoord - vec2(.5, .5)) * 2.0;
      // only color in circle insides
      if (dist > 1.0)
        discard;
      // anti-aliasing (https://rubendv.be/blog//opengl/drawing-antialiased-circles-in-opengl/)
      // outer 2 pixels are anti-aliasing, which corresponds to an outer annulus
      float aliasFrac = (size - 2.0) / size;
      float alpha = smoothstep(1.0, aliasFrac, dist) * 0.9;
      outColor = vec4(((size - 2.5) / 100.0), 0.2, 0.3, alpha);
      // pre-multiply alpha... something about blending edges
      outColor.rgb *= outColor.a;
    }
  `));
  gl.linkProgram(program);
  if (!gl.getProgramParameter(program, gl.LINK_STATUS))
    throw new Error('Unable to link program: ' + gl.getProgramInfoLog(program));
  gl.useProgram(program);

  /*
   * Blending
   */
  gl.blendFunc(gl.ONE, gl.ONE_MINUS_SRC_ALPHA);
  gl.enable(gl.BLEND);

  /*
   * Viewport
   */
  const u_resolutionLoc = gl.getUniformLocation(program, 'u_resolution');
  let displayWidth, displayHeight;
  function resize () {
    const canvas = gl.canvas;
    displayWidth  = canvas.clientWidth;
    displayHeight = canvas.clientHeight;
    if (canvas.width !== displayWidth || canvas.height !== displayHeight) {
      canvas.width  = displayWidth;
      canvas.height = displayHeight;
      gl.viewport(0, 0, displayWidth, displayHeight);
      // update the resolution global uniform on the GPU
      gl.uniform2f(u_resolutionLoc, canvas.width, canvas.height);
    }
  }
  resize();
  window.addEventListener('resize', resize, false);

  // call generation function
  init(displayWidth, displayHeight);

  /*
   * Bind circle data buffer
   */
  const circleCoordLoc = gl.getAttribLocation(program, 'circleCoord');
  gl.enableVertexAttribArray(circleCoordLoc);
  gl.bindBuffer(gl.ARRAY_BUFFER, gl.createBuffer());
  gl.vertexAttribPointer(circleCoordLoc, 3, gl.FLOAT, false, 4 * 3, 0);

  /*
   * Draw loop
   */
  let iterations = 1;
  let lastDrawTime = performance.now();
  requestAnimationFrame(draw);
  function draw () {
    let curTime = performance.now();
    // optimize iteration count from time since last draw
    updateIterationCount(curTime - lastDrawTime);
    for (let i = 0; i < iterations; i++)
      timeStep(displayWidth, displayHeight);
    // copy the circle data from array buffer memory to the GPU
    gl.bufferData(gl.ARRAY_BUFFER, circleFloat32Array, gl.DYNAMIC_DRAW);
    // draw the circles on the GPU from the data
    gl.drawArrays(gl.POINTS, 0, circleCount);
    // animation loop
    lastDrawTime = curTime;
    requestAnimationFrame(draw);
  }

  /*
   * Naive iteration count optimization
   */
  const maxIterations = 64;
  let iterationConvergence = 0;
  let convergedIterations = 0;
  function updateIterationCount (dt) {
    if (dt < 17 && iterations < maxIterations / 2) {
      iterationConvergence = 0;
      iterations *= 2;
    }
    else if (dt < 20 && iterations < maxIterations) {
      iterationConvergence = 0;
      iterations++;
    }
    else if (dt > 55 && iterations > 1) {
      iterationConvergence = 0;
      iterations--;
    }
    if (iterationConvergence < 10) {
      iterationConvergence++;
      if (iterationConvergence === 10 && convergedIterations !== iterations) {
        convergedIterations = iterations;
        console.log(`timeStep of ${iterations} iterations/frame, ~${Math.round(1000 / dt)} frames/sec.`);
      }
    }
  }
};
