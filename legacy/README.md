unfreeze-ps
===========

Unfreeze a beach-balling Photoshop on Mac

Installation
------------

Download the latest version here

http://files.daveeddy.com/unfreeze-latest.zip

...and run the app.

![screenshot1](http://www.daveeddy.com/static/media/github/unfreeze-ps.png)

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

Command Line
------------

Download the command line app instead of the .app

    $ npm install -g unfreeze-ps
    $ unfreeze-ps

Development
-----------

This program is written in [Node.js](http://nodejs.org), and bundled as an app with
[node-webkit](https://github.com/rogerwang/node-webkit).

Bundling instructions are in the Makefile

Real Life Stories
-----------------

- http://skyeillustration.com/post/66-photoshop-trick


License
-------

MIT
