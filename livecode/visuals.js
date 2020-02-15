// waves
osc(8, 0.2, [0.1, 0.2, 0.12])
  .color(0.1,400,100)
  .rotate(1.55)
  .modulateScrollY(osc(10),0.2,0)
  .modulateScale(osc(4,-0.2,0))
  .colorama(100)
  .contrast( ({time}) => 4 + Math.sin(time) * 1.2)
  .out()

// windows
solid(0,0,0)
  .add(noise(4,0.08).thresh(0.5,0.04))
  .contrast(0.2)
  .modulateScrollY(osc(10),0.2,0)
  .modulateScale(osc(2,-0.2,0))
  .color(
    () => {
      if(a.fft[1] > 0.2) return 0.46
      else
      return 0
    },
    0, 0
  )
  .colorama(200)
  // .modulateHue(osc(20).color(0.4,0.8,0.8))
  .out()

// sideways ripples
osc([4,7,7,7,10,20,40].fast(4), 0.2, [0.1, 0.2, 0.12]).scrollX(0.1, 0.2)

  .color(0.3,0.4,0.6)
  .modulateScale(
      osc(200)
      .modulate(
        noise(()=>1+a.fft[0]).modulateScrollX(noise(1,0.1))
      )
      // block
      // .mult(shape(4,1,1).invert())
    )
  .scale(0.5)
  .out()

// pools
osc(7, 0.1)
  .add(noise(0.7, 0.1))
  .color(2, 2, 100)
  .colorama(100)
  // .luma(0.2)
  .modulate(osc(25,0.1,0.5)
  // modulated by voronoih
  //    .modulate(voronoi(10, 2, 5)
    .kaleid(50)
    .scale(({time})=>Math.sin(time)*0.5+1)
    .modulate(noise(0.6,0.5)),
    () => a.fft[2]
   )
  .out()

// violet lights
voronoi(() => 5 + a.fft[0]*10, 2, 5)
  .modulate(osc(45,0.1,0.5)
  // .colorama(10)
  .kaleid(50)
  .scale(({time})=>Math.sin(time)*0.8+4)
  .modulate(noise(0.6,0.5)),() => a.fft[2])
  .color([1,1,1,1],[1,1,1,1],[2,1,1,1])
  .out()

// screen test: fast colors
osc([1,2,2,1,1,1,1,1,1,1,1,1,1,1,400,800,1000], 0.9, 200).out()

// fft test:
a.show()

a.setScale(15)

// -> 1 audio sensitivity
a.setSmooth(0.20)

// go to black
solid().out()
