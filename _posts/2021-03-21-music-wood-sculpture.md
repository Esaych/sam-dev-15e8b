---
title: Visualized Music on my Wood Sculpture
subtitle: >-
  I finished building my electronic wooden sculpture, and I set up a wifi synchronized
  sound system in my house, so it only made sense to combine the two!
excerpt: >-
  I finished building my electronic wooden sculpture, and I set up a wifi synchronized
  sound system in my house, so it only made sense to combine the two!
date: "2021-03-21"
thumb_img_path: images/p/npm/music-cover.gif
thumb_img_alt: Visualized Music on my Wood Sculpture
content_img_path: images/p/npm/pic1.jpg
carousel:
  images:
    - image: /images/p/npm/pic2.jpg
    - image: /images/p/npm/pic3.jpg
    - image: /images/p/npm/pic4.jpg
    - image: /images/p/npm/pic5.jpg
    - image: /images/p/npm/pic6.jpg
    - image: /images/p/npm/pic7.jpg
    - image: /images/p/npm/pic8.jpg
seo:
  title: Visualized Music on my Wood Sculpture
  description: >-
    I finished building my electronic wooden sculpture, and I set up a wifi synchronized
    sound system in my house, so it only made sense to combine the two!
  extra:
    - name: "og:type"
      value: article
      keyName: property
    - name: "og:title"
      value: Visualized house sound on my wooden sculpture
      keyName: property
    - name: "og:description"
      value: >-
        I finished building my electronic wooden sculpture, and I set up a wifi synchronized
        sound system in my house, so it only made sense to combine the two!
      keyName: property
    - name: "og:image"
      value: images/p/np-music-cover.jpg
      keyName: property
      relativeUrl: true
    - name: "twitter:card"
      value: summary_large_image
    - name: "twitter:title"
      value: Visualized house sound on my wooden sculpture
    - name: "twitter:description"
      value: >-
        I finished building my electronic wooden sculpture, and I set up a wifi synchronized
        sound system in my house, so it only made sense to combine the two!
    - name: "twitter:image"
      value: images/p/npm/music-cover.jpg
      relativeUrl: true
layout: post
---

{% include youtube.html id="kpbXMeKzsoM" %}

If you haven't already, check out how I made my [electronic wooden sculpture](/posts/neopixel-wood-sculpture/), and how I set up a wifi synchronized
sound system in my house!

The way I got this music visualization working was by integrating SnapCast, C.A.V.A., and the NeoPixel library, all running on Raspberry Pi 3s.

![system diagram](/images/p/npm/sys-diagram.png)

<h5>1. SnapCast Server</h5>

[Snapcast](https://github.com/badaix/snapcast) is an amazing piece of open-source software. We used the server from SnapCast on one of the Raspberry Pis in our house
which acts as the hub for our sound system. The hub server has [other software](https://github.com/dtcooper/raspotify)
which tricks devices on our home wifi to think it's a smart Spotify device, and then SnapCast translates that into a
broadcast to our network to any SnapCast client to seamlessly synchronize and play to audio.

<h5>2. SnapCast Client</h5>

The Raspberry Pi at the bottom of [this wooden sculpture](/posts/neopixel-wood-sculpture/) is set up to have
a SnapCast client. It's able to automatically sync with the hub and emit sound data to an audio output
with perfect timing to other speakers in our house. In this case, I set that output to be to named pipe on the file system (/tmp/snapfifo).

<h5>3. C.A.V.A.</h5>

[C.A.V.A.](https://github.com/karlstav/cava) is a bar spectrum audio visualizer for the Linux terminal. It is originally
built to analyze audio out of ALSA and generate a visualizer you would likely see in a [Rainmeter](https://www.rainmeter.net/)
background.

![CAVA](https://raw.githubusercontent.com/karlstav/cava/master/example_files/cava.gif)

I used that visualizer to emit 3 bars, only 3 bars because there are 3 ring lights in my sculpture. Then I set the
output of the visualizer to be to another file pipe as an ASCII output. That looked something like 0;0;0 for no music,
bar heights are at 0. 255;0;0 for really loud frequency in the bass, and 0:0:255 for really loud frequency in the high notes.

<h5>4. Python Program</h5>

Then I got to work writing [a python program](https://github.com/Esaych/neopixel-server/blob/main/music.py) to read these
bar data from the file pipe, and then used the [matplotlib cmap function](https://matplotlib.org/stable/gallery/color/colormap_reference.html)
to convert a # on a range from 0 to 255 to color from #000000 to #FFFFFF. And matplotlib lets you
do that in many many different ways.

So all I had to do was set a cool color range (we started with inferno), translate those into red green blue channels
and then send those commands down the line to the LEDs!

Crediting my roommate [Robert Morrison](https://www.linkedin.com/in/robmorr/) for helping me find matplotlib cmap and for
helping me write this bar height to color python script.

![Color Map](/images/p/npm/colormap.png)

<h5>5. NeoPixel</h5>

NeoPixel has really nice python support, so our [adapter](https://github.com/Esaych/neopixel-server/blob/main/control.py) proved pretty simple.
I originally wired the 3 [adafruit neopixel rings](https://www.amazon.com/dp/B00KAE3R1U/) with all three LEDs
on separate circuits and separate signal cables, but I had to go back and adjust the wiring so that the wiring was
done in parallel (due to Raspberry Pi hardware limitations). This let me send a single signal down the line which
was designed for a strip of 36 LEDs. The base ring would read the first 12 channels of data and forward 24 channels to the second ring.
The second ring would read 12 more, and forward the last 12 to the highest ring. This let me treat the entire sculpture like 1 LED strip.

<h3>Extras</h3>

<h5>Play/Pause detection</h5>

Now I had a music program and a weather program on the sculpture, in order to make the two interact, I needed a way to
tell the sculpture that music was playing and it needs to switch. To do this, I used [Raspotify's --onevent flag](https://github.com/librespot-org/librespot/discussions/639)
to trigger a python script which would make a get call to a flask service that controls the sculpture's mode.

[The script I wrote](https://github.com/Esaych/neopixel-server/blob/main/snapserver/spotifyEvent.py) sends commands
to change to the music mode on "playing" and change to weather on "paused".

<h5>Different Color Maps</h5>
 
I wanted to make it change color maps when it got to a different song. The best solution which made sense was to use
Raspotify's "TRACK_ID" value, which is Spotify's track id. I would have to use Spotify's developer API to get the track
name and details, but the ID was all I needed. [I hashed the ID](https://github.com/Esaych/neopixel-server/blob/main/server.py#L139) 
to get an integer translation of the track id, and then
used that number with a modulus function to [pick a color map](https://github.com/Esaych/neopixel-server/blob/main/music.py#L76) from an array.

Now we had songs play and translate to their very own color mapping out of the color maps I handpicked. It was great seeing new colors for every song.

<h3>Result</h3>

{% include carousel.html height="50" unit="%" duration="10" %}
