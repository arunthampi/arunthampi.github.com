---
title: Move Fast & Ship Things with Go & Equinox
description: >-
  One of my favorite features of the Go programming language is that you can
  distribute executable binaries of your software that users can…
date: '2016-03-07T20:01:30.239Z'
categories: []
keywords: []
layout: post
---

One of my favorite features of the Go programming language is that you can distribute executable binaries of your software that users can download and run without installing huge VMs such as Ruby, Python and Node.JS; thus removing huge barriers for adoption.

With Go 1.5, cross-compilation is built in to the compiler which means that you can compile your Go program on OS X for Windows, Linux and of course OS X.

But this is just one piece of the puzzle — what happens when you need to provide over-the-air software updates and nightly builds?

#### Enter Equinox

[Equinox](https://equinox.io) is a service built by [Alan Shreve](https://twitter.com/inconshrevable) and [Kyle Conroy](https://twitter.com/kyle_conroy) that lets you easily package and distribute your Go apps. (As an aside, you should check out [ngrok](https://ngrok.io) by the same folks which is another super useful piece of software and a required part of any developer’s toolbox). With Equinox you can cross-compile your Go program for multiple operating systems and architectures, upload your binaries to a well-known URL that your users can download from and provide software updates to all your users with very few lines of code. You can also provide multiple release channels for your program: so a “stable” channel where you only upload point releases and a “beta” channel where a release is made for every commit made to the master branch.

Additionally, Equinox also provides with you .pkg and .msi installers for OS X and Windows respectively, making your apps just that little bit easier to install for users.

#### Relax & Equinox

When I first released [Relax](https://github.com/zerobotlabs/relax) as an open-source project, I thought the installation process was fairly straightforward — download the Go toolchain (which in itself is more straightforward than a lot of other languages), run _go get github.com/zerobotlabs/relax_ and you’re done.

Turns out this was a stumbling block for quite a few users who were not familiar with Go at all and didn’t want to have to install it (especially since one of the stated benefits of using Relax was that you didn’t have to know Go to have to operate it). That’s when I stumbled on Equinox and decided that Relax needed its own pre-built binaries.

The setup process for Equinox is fairly simple and the [docs are great](https://equinox.io/docs#releasing).

Since relax already had a Makefile, all I had to do was add a command to perform an Equinox release and appropriately, I called it [_make release_](https://github.com/zerobotlabs/relax/blob/master/Makefile#L22-L23)_._ Release calls _./script/release_ which then internally calls _go build_ and uploads the binary to Equinox.

Couple of things to note here:

**_$EQUINOX\_SIGNING\_KEY\_FILE_** is the path to the private key used to sign your uploads. According to the [Equinox docs](https://equinox.io/docs#generate-signing-key):

> Cryptographically signing your releases with a private key allows untrusted third parties to distribute your updated code while providing end-to-end guarantees that updates come only from you, the developer, and no one else.

**_$EQUINOX\_CREDENTIAL_** contains your credential token which is used to authenticate and authorize the release tool to upload builds to your Equinox account. Your credential can be generated [like so](https://equinox.io/docs#create-credential).

Before running _make release_, I ensure that those two environment variables are set and boom, I have my Equinox releases set up.

You then get a nice [downloads page](https://dl.equinox.io/zerobotlabs/relax/stable) for your project.

![](https://cdn-images-1.medium.com/max/800/1*XDylVCmD2aqL1fw0LEBY1A.png)

#### Automating Builds with Travis

So manually releasing of your Go apps is great and is a huge step forward but what if you wanted to automate this? Relax already had a pretty comprehensive test suite so I wanted an Equinox release to happen every time a successful Travis build was completed.

([Travis](https://travisci.org) of course is an awesome continuation integration service that is well suited for open-source projects).

With automated builds, it probably is a good idea to use a separate channel since not all users would want to use the bleeding edge of your software. In Relax’s case, I created a **_beta_** channel.

The first step is to add a _.travis.yml_ file to your project. This is what Relax’s [.travis.yml file](https://github.com/zerobotlabs/relax/blob/e8e7a6ee0cc70d90ea6fde2809de2a82624053e9/.travis.yml) looks like:

The script to run the test itself is _make test_ and once a successful build is completed, two commands are executed:

*   _make install\_equinox_: Installs Equinox within the Travis build environment. This make command [calls _./script/install\_equinox_](https://github.com/zerobotlabs/relax/blob/d87a09d02333141eabbcdcf134aeeee2e55f6f18/Makefile#L25-L26) which installs equinox in a cross-platform way (at least cross platform to OS X and Linux):

*   _make release_: Builds and uploads binaries to Equinox. The release command calls _./script/release_ which looks like this:

The release script is a slight modification from the earlier one in this post in that there is an environment variable that is used to decide whether to publish to the “stable” channel or the “beta” channel. The variable **_EQUINOX\_BETA_** is set to true in Travis so that Travis only publishes to the beta channel.

#### Keeping Secrets Safe in Travis

As described earlier, both $EQUINOX\_SIGNING\_KEY\_FILE and $EQUINOX\_CREDENTIAL contains information that must not be publicly shared. Luckily Travis lets us use encrypted files and environment variables to keep these secrets away from prying eyes.

The **_$EQUINOX\_SIGNING\_KEY\_FILE_** variable is set to script/equinox.key in Travis but the file itself is encrypted using the Travis CLI tool and is uploaded to Github. The encrypted file can be seen in Github as [script/equinox.key.enc](https://github.com/zerobotlabs/relax/blob/master/script/equinox.key.enc) and is decrypted by Travis with the command specified in the [before\_install stanza](https://github.com/zerobotlabs/relax/blob/e8e7a6ee0cc70d90ea6fde2809de2a82624053e9/.travis.yml#L9-L10) in .travis.yml:

More information on how you can set up encrypted files in Travis can be [found here](https://docs.travis-ci.com/user/encrypting-files/).

The **_$EQUINOX\_CREDENTIAL_** again is another encrypted environment variable set in Travis.

#### Ta Da!

With this setup, every time there is a successful Travis build a new release is made to the Equinox beta channel for Relax and you can download beta releases [here](https://dl.equinox.io/zerobotlabs/relax/beta).

#### So what is Relax anyway?

![](https://cdn-images-1.medium.com/max/800/1*LDSyyl2JZ-Vt3Zp0bh-qXg.png)

Relax is a Go-based message broker used to make Slack bots as a service. It is used to power my day job [Nestor](http://www.asknestor.me) — which is a programmable Slack bot that can be used to automate all the mundane parts of your company and becomes your go-to ChatOps bot.

Coincidentally, the [nestor CLI](https://github.com/zerobotlabs/nestor-cli) is another Go software tool that uses Equinox but that’s a topic for another post.
