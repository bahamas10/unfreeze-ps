Unfreeze Photoshop
==================

Unfreeze a beach-balling Photoshop on Mac

![icon](/icon.png)

disclaimer: i'm an amazing designer, and this icon was made 100% in apple preview.

http://unfreezephotoshop.daveeddy.com

Installation
------------

Download the latest version here

http://unfreezephotoshop.daveeddy.com/unfreeze-photoshop-latest.zip

unzip, and run the app

FAQ
---

### How does this work?

When photoshop starts beach balling, it's sometimes possible to get it to start
responding without having to force-quit it and lose all of your work.

The operating system will typically send a signal to the photoshop process to
pause it, if the operating system is having problems.  These "problems" include
running low on RAM, running low on disk space, or using 100% CPU.

After you alleviate the "problems" mentioned above, running this program will send
a `SIGCONT` signal to the photoshop process to tell it to continue operating.

### Will this always work?

No.  If your photoshop is beach balling for another reason, this will not do anything.

### Is this dangerous to do?

No.  `SIGCONT` is a harmless signal to send if the process is not paused; it'll be as-if
nothing has happened.  Worst-case scenario: this program does nothing.

Real Life Stories
-----------------

- http://skyeillustration.com/post/66-photoshop-trick

Legacy
------

This program was originally written in [Node.js](http://nodejs.org), and bundled as an app with
[node-webkit](https://github.com/rogerwang/node-webkit).

This is found in the `legacy` directory

License
-------

MIT
