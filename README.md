# Simple boiler plate for Intel Edison + Resin.io

This repo is a simple way to get started with the [Grove - Starter Kit Plus][grove-kit-link] and the [Intel Edison][edison-link].

It was spurred on by the great blog post by [Gergely Imreh][Gergely-blog] ["A Window to irc with Edison and Resin"][blog-link], in which he details some issues he hit on his road to building his IRC chat display. I thought it would be useful for others to have some reference code for building things with the Intel Edison Starter kit and get some quick and dirty sensor examples running.

In this repo you will see the basic there is the standard resin.io application layout with a Dockefile to prepare our runtime and then a folder called `app` which contains our python source code. In the `app` folder you will find a few examples which make use of the [UPM][upm-link] library and allow you to interface with a couple of different Grove sensors.

To get some of these examples running on your Edison, first signup for an account at [resin.io][resin-signup] and run through the [Getting Started with Intel Edison and Resin.io][getting-started-link] guide.

Once you have Edison running on resin.io and can happily push code to it, clone this repo and edit the `docker-entrypoint.sh` file so that it points to the python script you want to run on the device. Initially this script is just telling the container to start running `rgb-lcd.py`, but you can switch this to any of the demos in the `app` folder. Now just `git push` this code to your Edison.

[Gergely-blog]:https://gergely.imreh.net/blog/about/
[blog-link]:https://gergely.imreh.net/blog/2015/08/a-window-to-irc-with-edison-and-resin/
[upm-link]:https://github.com/intel-iot-devkit/upm.git
[edison-link]:http://www.intel.co.uk/content/www/uk/en/do-it-yourself/edison.html
[grove-kit-link]:http://www.seeedstudio.com/depot/Grove-starter-kit-plus-Intel-IoT-Edition-for-Intel-Galileo-Gen-2-and-Edison-p-1978.html
[resin-signup]:https://dashboard.resin.io/signup
[getting-started-link]:http://docs.resin.io/#/pages/installing/gettingStarted-Edison.md
