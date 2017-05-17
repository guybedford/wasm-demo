#include <math.h>
#include <stdbool.h>
#include <stddef.h>

// reduced to 10000 for init performance
#define CIRCLE_COUNT 10000
#define GRID_WIDTH 70
#define GRID_HEIGHT 120

float randomf ();
float expf (float);

struct Circle {
  float x;
  float y;
  float r;
};

struct CircleV {
  float vx;
  float vy;
};

struct Circle circleData[CIRCLE_COUNT];
struct CircleV circlevData[CIRCLE_COUNT];

int getCircleCount () {
  return CIRCLE_COUNT;
}

struct Circle* getCircleDataOffset () {
  return &circleData[0];
}

bool detectCircleCollision (float x1, float y1, float r1, float x2, float y2, float r2) {
  // before circle intersection, check bounding box intersection
  if (x1 + r1 < x2 - r2 || x1 - r1 > x2 + r2 ||
      y1 + r1 < y2 - r2 || y1 - r1 > y2 + r2)
    return false;
  // circle intersection when distance between centers < radius total
  return sqrtf(powf(x2 - x1, 2) + powf(y2 - y1, 2)) <= r1 + r2;
}

void init (float displayWidth, float displayHeight) {
  for (int i = 0; i < CIRCLE_COUNT; i++) {
    bool collision;
    float x, y, r;
    do {
      collision = false;
      x = displayWidth * randomf();
      y = displayHeight * randomf();
      // size of 0.5 - 128, exponentially distributed (maximum gl_POINT render size)
      r = ceilf(expf(randomf() * 8) / 23.2887);

      // ensure within window bounds
      if (displayWidth - (x + r) < 0 || x - r < 0 ||
          displayHeight - (y + r) < 0 || y - r < 0) {
        collision = true;
      }
      else {
        // ensure no collisions for starting position
        for (int j = 0; j < i; j++) {
          if (detectCircleCollision(x, y, r, circleData[j].x, circleData[j].y, circleData[j].r)) {
            collision = true;
            break;
          }
        }
      }
    }
    while (collision);

    circleData[i].x = x;
    circleData[i].y = y;
    circleData[i].r = r;

    // velocity of -0.1 - +0.1 pixels / iteration
    circlevData[i].vx = (randomf() - 0.5) * 0.1;
    circlevData[i].vy = (randomf() - 0.5) * 0.1;
  }
}

struct CellCircle {
  int circleIndex;
  struct CellCircle* next;
};

struct CellCircle cellCircles[CIRCLE_COUNT * 4];
struct CellCircle* grid[GRID_WIDTH][GRID_HEIGHT];

void timeStep (float displayWidth, float displayHeight) {
  for (int p = 0; p < GRID_WIDTH; p++) {
    for (int q = 0; q < GRID_HEIGHT; q++) {
      grid[p][q] = NULL;
    }
  }

  int cellCircleCount = 0;

  for (int i = 0; i < CIRCLE_COUNT; i++) {
    float xi = circleData[i].x;
    float yi = circleData[i].y;
    float ri = circleData[i].r;

    float vxi = circlevData[i].vx;
    float vyi = circlevData[i].vy;

    // gravity
    vyi += 0.0001;

    // window bounds
    if (displayWidth - (xi + ri) < 0 && vxi > 0 || xi - ri < 0 && vxi < 0) {
      vxi = -vxi;
    }
    if (displayHeight - (yi + ri) < 0 && vyi > 0 || yi - ri < 0 && vyi < 0) {
      vyi = -vyi;
    }

    circleData[i].x = xi + vxi;
    circleData[i].y = yi + vyi;
    circlevData[i].vx = vxi;
    circlevData[i].vy = vyi;

    int leftCol = floorf((xi - ri) / displayWidth * GRID_WIDTH);
    int rightCol = floorf((xi + ri) / displayWidth * GRID_WIDTH);
    int topRow = floorf((yi - ri) / displayHeight * GRID_HEIGHT);
    int bottomRow = floorf((yi + ri) / displayHeight * GRID_HEIGHT);

    if (leftCol < 0)
      leftCol = 0;
    if (rightCol >= GRID_WIDTH)
      rightCol = GRID_WIDTH - 1;
    if (topRow < 0)
      topRow = 0;
    if (bottomRow >= GRID_HEIGHT)
      bottomRow = GRID_HEIGHT - 1;

    for (int p = leftCol; p <= rightCol; p++) {
      for (int q = topRow; q <= bottomRow; q++) {
        struct CellCircle* cellCircle = &cellCircles[cellCircleCount++];
        cellCircle->circleIndex = i;
        cellCircle->next = grid[p][q];
        grid[p][q] = cellCircle;
      }
    }
  }

  for (int p = 0; p < GRID_WIDTH; p++) {
    for (int q = 0; q < GRID_HEIGHT; q++) {
      struct CellCircle* iCellCircle = grid[p][q];

      while (iCellCircle) {
        int i = iCellCircle->circleIndex;

        float xi = circleData[i].x;
        float yi = circleData[i].y;
        float ri = circleData[i].r;

        float vxi = circlevData[i].vx;
        float vyi = circlevData[i].vy;

        struct CellCircle* jCellCircle = iCellCircle;
        while ((jCellCircle = jCellCircle->next)) {
          int j = jCellCircle->circleIndex;

          float xj = circleData[j].x;
          float yj = circleData[j].y;
          float rj = circleData[j].r;

          if (detectCircleCollision(xi, yi, ri, xj, yj, rj)) {
            float vxj = circlevData[j].vx;
            float vyj = circlevData[j].vy;

            // calculate collision unit vector
            float collDx = xj - xi;
            float collDy = yj - yi;
            float collLen = sqrtf(collDx * collDx + collDy * collDy);
            collDx = collDx / collLen;
            collDy = collDy / collLen;

            // dot product of unit collision vector with velocity vector gives
            // 1d collision velocities before collision along collisionv vector
            float cui = collDx * vxi + collDy * vyi;
            float cuj = collDx * vxj + collDy * vyj;

            // skip collision if moving away from eachother
            if (cui - cuj <= 0)
              continue;

            // we then use 1d elastic collision equations
            // to get resultant 1d velocities after collision
            // (https://en.wikipedia.org/wiki/Elastic_collision)
            float massSum = ri + rj;
            float massDiff = ri - rj;
            float cvi = (cui * massDiff + 2 * rj * cuj) / massSum;
            float cvj = (2 * ri * cui - cuj * massDiff) / massSum;

            // calculate the collision velocity change
            float dcvi = cvi - cui;
            float dcvj = cvj - cuj;

            // apply that velocity change dotted with the collision unit vector
            // to the original velocities
            circlevData[i].vx = vxi + collDx * dcvi;
            circlevData[i].vy = vyi + collDy * dcvi;
            circlevData[j].vx = vxj + collDx * dcvj;
            circlevData[j].vy = vyj + collDy * dcvj;
          }
        }

        iCellCircle = iCellCircle->next;
      }
    }
  }
}
