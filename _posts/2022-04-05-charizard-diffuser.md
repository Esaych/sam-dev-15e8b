---
title: 3D Printing a Charmander Diffuser
subtitle: >-
  Building a personalized birthday present for my friend Kevin!
excerpt: >-
  Building a personalized birthday present for my friend Kevin!
date: "2022-04-05"
img_root: /images/p/charmander/
thumb_img_path: images/p/charmander/cover.jpg
thumb_img_alt: 3D Printing a Charmander Diffuser
content_img_path: images/p/charmander/full-vert.jpeg
carousel:
  images:
    - image: /images/p/charmander/car/IMG_1989.jpeg
    - image: /images/p/charmander/car/IMG_1966.jpeg
    - image: /images/p/charmander/car/IMG_1968.jpeg
    - image: /images/p/charmander/car/overhead.jpeg
    - image: /images/p/charmander/car/closeup.jpeg
    - image: /images/p/charmander/parts.jpeg
seo:
  title: 3D Printing a Charmander Diffuser
  description: >-
    Building a personalized birthday present for my friend Kevin!
  extra:
    - name: "og:type"
      value: article
      keyName: property
    - name: "og:title"
      value: 3D Printing a Charmander Diffuser
      keyName: property
    - name: "og:description"
      value: >-
        Building a personalized birthday present for my friend Kevin!
      keyName: property
    - name: "og:image"
      value: images/charmander/full-vert.jpg
      keyName: property
      relativeUrl: true
    - name: "twitter:card"
      value: summary_large_image
    - name: "twitter:title"
      value: 3D Printing a Charmander Diffuser
    - name: "twitter:description"
      value: >-
        Building a personalized birthday present for my friend Kevin!
    - name: "twitter:image"
      value: images/p/charmander/full-vert.jpeg
      relativeUrl: true
layout: post
---

![charmander diffuser]({{page.img_root}}charmandergif.gif)

I made something cool, I wanted to share how I made it!

<h3> My friend Kevin </h3>

This is me and my friend Kevin.

{% include insta.html id="CboOsz9q8Is" %}

We met in college and became such good friends that we decided
to room together our junior year. He's since moved to Seattle to join me on my beautiful rocky mountain
adventures. Here's a picture of us snowboarding with him in his favorite onesie.

His birthday was a couple weeks ago and I wanted to came up with this idea of getting him a diffuser
(because its good for your skin). But a diffuser is $20 on Amazon
and it felt a little impersonal... thus came this amazing idea!

<h3>Creating Charmander</h3>
 
Typically when I want to do design something difficult, I look to see if anyone else
already did it on Thingiverse! Thingiverse is a beautiful place of user contributed
models and luckily charmander is all over the place.

![thingiverse screenshot]({{page.img_root}}thingiverse-ss.jpeg)

Even more fortunate, someone created a model of [Charmander breathing LITERAL FIRE](https://www.thingiverse.com/thing:2685138) (thanks [suatbatu](https://www.suatbatu.com/)).

**Unfortunately** it wasn't actually available for download on thingiverse.
**Fortunately** he did make it [downloadable on Cluts 3D](https://cults3d.com/en/3d-model/various/fire-breathing-charmender) where I could support him for his work!

So I downloaded this as a base. It had probably 1,000,000 vertices on the model and crashed every single software I had except for Fusion 360.
In Fusion the first thing I did was reduce the # of vertices using the Mesh>Modify>Reduce tool.

From there I measured out my diffuser, and built a model of it as a separate object. I put a little tab to indicate where the air comes out of.

![diffuser model]({{ page.img_root }}diffuser-model.jpeg)

Then all I needed to do was resize Charmader and cut a hole the exact size of the diffuser somewhere inside of him.
This is fairly easy as you can merge two bodies but rather than add, you can cut with the secondary body. Hence a diffuser size hole was made.

![cut out charmander]({{ page.img_root }}design.gif)

<h3>Printing Charmander</h3>

I _thought_ this might be an easy print but I was quickly wrong when I found out Charmander was bigger than my
Ender 3 printer could handle!

Frusting but easy fix. I first cut Charmander in half such that his top half barely fits on the plate. And then retrospectively
realized that this is the perfect split such that I can glue the top of the diffuser into the top of Charmander.

Then the tail didn't fit either so I cut the tail off to make a total of 3 different parts to print.

Now we had to send to the printer, but the amount of filament is insane for this type of print. 48 hours for just
the top part of charmander. I played around with reducing the
support structures and found out I could try printing with [tree supports](https://all3dp.com/2/cura-tree-support/)!

In time I made my first print which was just a test to ensure it fit the diffuser properly and lined up!

![art trash]({{ page.img_root }}/art-trash.jpeg)

Not shown is my first print which failed miserably because the base of the tree supports just fell off the board and when it actually started
printing his hand, now floating in midair, filement was going everywhere.

Since the second print lined up, I went ahead and [ordered a new roll of filament](https://www.amazon.com/gp/product/B06ZZDMD86) for the Charmander which was orange and translucent for the light to shine through.

Here are some of prints coming off the printer:

![tree supports]({{ page.img_root }}/tree-supports.jpeg)
![tail]({{ page.img_root }}/tail.jpeg)

<h3>Final Assembly</h3>

The last bit was almost trivial. Glued the tail to the base.

![parts]({{ page.img_root }}/parts.jpeg)

After testing it a bit I realized there's condensation in the mouth that drips back into the head.
To fix that I got out some caulk and filled the gap between the diffuser and the throat.
It's hard to see but its the white putty holding the top together.

![caulk]({{ page.img_root }}/caulk.jpeg)

<h3>Conclusions</h3>

It was about a week late but Kevin got his present!

Here's some things I learned:

- This print took almost the whole role of filament. So I am better at ballparking filament costs now!
- I learned how to use tree supports! And I'm never going back to normal supports.
- I learned that rafts are super helpful for keeping tree supports on the plate.
- Water management is something to consider in design. (Condensation needed a quick fix)
- When creating a case for something, best to make that something copy the functionality of the inner product. Having the top come off helped the design significantly.
- 3D printing is still really fun.

{% include carousel.html height="50" unit="%" duration="10" %}

<style>
img[alt="charmander diffuser"] {
    width: 60%;
}
img[alt="diffuser model"] {
    width: 60%;
}
img[alt="art trash"] {
    width: 60%;
}
img[alt="caulk"] {
    width: 50%;
}
</style>
