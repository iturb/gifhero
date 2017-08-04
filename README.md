![GifHero](logo.png)

![iOS](https://img.shields.io/badge/iOS-9.0%2B-orange.svg) 
![Swift](https://img.shields.io/badge/Swift-3.1-orange.svg)
![Devices](https://img.shields.io/badge/Devices-Universal-orange.svg)
![license](https://img.shields.io/github/license/mashape/apistatus.svg?style=plastic)

# GifHero
GifHero is a library for iOS that renders animated GIF natively.

Here is an example of GifHero in action

![GifHero in action](screen1.gif)

## Install
### CocoaPods
You can get GifHero easily with CocoaPods.

If you are wondering what it is, take a look at: [https://cocoapods.org](https://cocoapods.org)

Add to your Podfile
```
pod 'GifHero'
```
Run installation
```
> pod install
```

## Usage
### Add GifHero
Once the Pod has being installed import it on your project
```
import GifHero
```
Create a new GifView
```
let gifView:GifView = GifView()
addSubview(gifView)
```
### Load with name
GifHero can load any GIF in your proyect by name
```
gifView.gifNamed = "pigJumping.gif"
```
### Load with URL
Additionaly GifHero can load GIFs by URL
```
let url:URL = getSomeUrl()
gifView.url = url
```
### Layout
By default GifHero uses layout constraints but if prefered autoresizing masks and rects can be used
```
gifView.translatesAutoresizingMaskIntoConstraints = true
gifView.frame = CGRect(x:0, y:0, width:100, height:100)
```
### ContentMode
By default GifHero perserves aspect to fill content (`scaleAspectFill`), if prefered fit content can be used too
```
gifView.contentMode = UIViewContentMode.scaleAspectFit
```
### Animation
By default GIfHero is paused to save resources but it is as easy to start animating as this
```
gifView.animating = true
```

## Demo
Clone or download this repo, it contains a Demo App

## Features
■ Best performance you will find

■ Less memory usage

■ Minimum energy usage

■ Easy to implement

## Magic behind GifHero
GifHero combines CoreGraphics and ImageIO to optimize rendering GIF.

GifHero preprocesses every frame, scaling and cropping if necessary, and does this exactly just once, so UIKit doesn't have to scale every frame, every loop of the animation; the final result is a significant drop in CPU usage and frees a lot of Memory by using the smallest images possible.

It is not necessary to wait for the preprocessing to finish, GifHero does it in the background while animating the frames as soon as they are ready. Most of the cases the animation flows flawlessly without delays.

There is a chance that while preprocessing a very big GIF with lots of frames the CPU usage starts to increase, but this will only by in the first stage, after this it should drop considerably.

Honeslty, you won't find a more optimized GIF renderer out there, but don't take GifHero word for it, download the demo app and try it for yourself.
