dotfiles and setup scripts for macOS
============

## Motivation

Setting up a new developer machine can be an **ad-hoc, manual, and time-consuming** process.  `dotfiles` aims to **simplify** the process with **easy-to-understand instructions** and **dotfiles/scripts** to **automate the setup** of the following:

* **OS X updates and Xcode Command Line Tools**
* **OS X defaults** geared towards developers
* **Developer tools**: zsh, oh-my-zsh, curl, git, Python, Ruby, etc
* **Developer apps**: Hpyer, VMWare Fusion, Chrome, etc
* **Javascript web development**: Node.js, JSHint, and Less

If you're interested in automation, `setup.sh` provides a customizable [setup script](#setup).  There's really no one-size-fits-all solution for developers so you're encouraged to make tweaks to suit your needs.

[Credits](#credits): This is a fork of [Donne Martin](https://github.com/krubenok/dotfiles)'s dev-setup repo. That repo builds on the awesome work from [Mathias Bynens](https://github.com/mathiasbynens) and [Nicolas Hery](https://github.com/nicolashery).

### Sections Summary
* Section 1 contains the dotfiles/scripts and instructions to set up your system.
* Sections 2 through 7 detail more information about installation, configuration, and usage for topics in Section 1.

## macOSsetup.sh macOS Setup Script

**Script tested on OS X 10.14 Mojave Beta**
Check for macOS updates and install them. Switch to Xcode-beta.app's command line tools. 

## Brew.sh Script

Installs homebrew taps several casks and installs my core applications.

#### Running with Git

##### Clone the Repo
    $ mkdir ~/Repos && cd ~/Repos
    $ git clone http://github.com/krubenok/krubenok && cd dotfiles

##### Run the setup.sh Script with Command Line Arguments

**Since you probably don't want to install every section**, the `setup.sh` script supports command line arguments to run only specified sections.  Simply pass in the [scripts](#scripts) that you want to install.  Below are some examples.

**For more customization, you can [clone](#clone-the-repo) or [fork](https://github.com/krubenok/dotfiles/fork) the repo and tweak the `setup.sh` script and its associated components to suit your needs.**

Run all:

    $ ./setup.sh all

Run `macOSsetup.sh`, `brew.sh`, and `macOS.sh`:

    $ ./setup.sh macOSsetup brew macOS

#### Scripts

* [setup.sh.sh](https://github.com/krubenok/dotfiles/blob/master/setup.sh.sh)
    * Runs specified scripts
* [macOSSetup.sh](https://github.com/krubenok/dotfiles/blob/master/macOSsetup.sh)
    * Updates macOS and installs Xcode command line tools
* [brew.sh](https://github.com/krubenok/dotfiles/blob/master/brew.sh)
    * Installs common Homebrew formulae and apps
* [macOS.sh](https://github.com/krubenok/dotfiles/blob/master/macOS.sh)
    * Sets up macOS defaults geared towards developers
* [web.sh](https://github.com/krubenok/dotfiles/blob/master/web.sh)
    * Sets up JavaScript web development

**Notes:**

* `setup.sh` will initially prompt you to enter your password.
* `setup.sh` might ask you to re-enter your password at certain stages of the installation.
* If OS X updates require a restart, simply run `setup.sh` again to resume where you left off.
* When installing the Xcode command line tools, a dialog box will confirm installation.
    * Once Xcode is installed, follow the instructions on the terminal to continue.
* `setup.sh` runs `brew.sh`, which takes awhile to complete as some formulae need to be installed from source.
* **When `setup.sh` completes, be sure to restart your computer for all updates to take effect.**

I encourage you to read through Section 1 so you have a better idea of what each installation script does.  The following discussions describe in greater detail what is executed when running the [setup.sh](https://github.com/krubenok/dotfiles/blob/master/setup.sh) script.

#### Install Xcode Command Line Tools

An important dependency before many tools such as Homebrew can work is the **Command Line Tools for Xcode**. These include compilers like gcc that will allow you to build from source.

**Note**: the `osxprep.sh` script executes this command.

Running the command above will display a dialog where you can either:
* Install Xcode and the command line tools
* Install the command line tools only
* Cancel the install

### brew.sh script

When setting up a new Mac, you may want to install [Homebrew](http://brew.sh/), a package manager that simplifies installing and updating applications or libraries.

Some of the apps installed by the `brew.sh` script include: VS Code Insiders,Github Desktop Beta, zsh, Hyper, Alfred, Firefox, Franz, etc...   **For a full listing of installed formulae and apps, refer to the commented [brew.sh source file](https://github.com/krubenok/dotfiles/blob/master/brew.sh) directly and tweak it to suit your needs.**

Run the `brew.sh` script:

    $ ./brew.sh

The `brew.sh` script takes awhile to complete, as some formulae need to be installed from source.

**For your terminal customization to take full effect, quit and re-start the terminal**

### macOS.sh script

When setting up a new Mac, you may want to set OS X defaults geared towards developers.  The `macOS.sh` script also configures common third-party apps.

**Note**: **I strongly encourage you read through the commented [macOS.sh source file](https://github.com/krubenok/dotfiles/blob/master/macOS.sh) and tweak any settings based on your personal preferences.  The script defaults are intended for you to customize.**  For example, if you are not running an SSD you might want to change some of the settings listed in the SSD section.

Run the `macOS.sh` script:

    $ ./macOS.sh

**For your terminal customization to take full effect, quit and re-start the terminal.**

### web.sh script

To set up a JavaScript web development environment, Run the `web.sh` script:

    $ ./web.sh

[Section 6: Web Development](#section-6-web-development) describes the installed packages and usage.

### Terminal Customization


Since we spend so much time in the terminal, we should try to make it a more pleasant and colorful place.

#### Configuration

The [macOS.sh script](#osxsh-script) contain terminal customizations.

### Hyper

I prefer Hyper over the stock Terminal, as it has some additional great features. 

### Contributions

Bug reports, suggestions, and pull requests are [welcome](https://github.com/krubenok/dotfiles/issues)!

### Credits

See the [Credits Page](https://github.com/krubenok/dotfiles/blob/master/CREDITS.md).

## Contact Info

Feel free to contact me to discuss any issues, questions, or comments.

My contact info can be found on my [GitHub page](https://github.com/krubenok).

### License

This repository contains a variety of content; some developed by Kyle Rubenok, most of it by Donne Martin, and some from third-parties.  The third-party content is distributed under the license provided by those parties.

The content developed by Donne Martin is distributed under the following license:

*I am providing code and resources in this repository to you under an open source license.  Because this is my personal repository, the license you receive to my code and resources is from me and not Donne Martin's employer (Facebook).*

    Copyright 2015 Donne Martin

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.


The content developed by Kyle Rubenok is distributed under the following license:

*I am providing code and resources in this repository to you under an open source license.*

    Copyright 2018 Kyle Rubenok

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.