# README

Lightweight Alpine Docker container that runs Robot Framework using Selenium Chrome (Chromium) driver in native headless mode (no Xvfb required).

## What is this repository for?

This repository has a Dockerfile that creates a container to run Robot Framework scripts locally, avoiding the hassles of setting up Python and Robot Framework locally.

## Versioning

* robotframework: latest
* robotframework-seleniumlibrary: latest
* robotframework-faker: latest
* Chrome webdriver: latest
* Chromium browser: latest

## Pre-requisites

Docker should be already installed and running.

## Assumptions

All of the helper scripts here are written for Mac/Linux in bash.  It should be possible to translate these over to a Windows equivilant or possibly use WSL (Windows Subsystem For Linux) to run these.

## Setup

### 1) Create docker image and shared volume:

```
./build
```

This creates an image based on the Dockerfile and creates a container running Robot Framework.


### 2) Set test path

Open robot.sh and set the TEST_PATH to point to the directory where your Robot tests live. By default the example tests in /test will be run. 
Note: Changes made to robot.sh do *not* require rebuilding as it runs locally.


### 3) Run Robot tests:

```
./robot.sh
```

This creates a new container, it will run any Robot Suite that is defined in your test directory (defined in step 2).

Test results (logs, reports and screenshots) will be stored in a /results directory.  --outputdir is configured in robot.sh. 

You should see results in the console:

```
./robot.sh 
==============================================================================
Robot                                                                         
==============================================================================
Robot.Test                                                                    
==============================================================================
Robot.Test.Open                                                               
==============================================================================
Open Site                                                             | PASS |
------------------------------------------------------------------------------
Robot.Test.Open                                                       | PASS |
1 critical test, 1 passed, 0 failed
1 test total, 1 passed, 0 failed
==============================================================================
Robot.Test                                                            | PASS |
1 critical test, 1 passed, 0 failed
1 test total, 1 passed, 0 failed
==============================================================================
Robot                                                                 | PASS |
1 critical test, 1 passed, 0 failed
1 test total, 1 passed, 0 failed
==============================================================================
Output:  /robot/results/output.xml
Log:     /robot/results/log.html
Report:  /robot/results/report.html
```

## Maintenance

Remove any containers and images related to this Dockerfile!  After running this you will need to rebuild your image.

```
./remove
```

This will cleanup files from /results. Handy to run between tests.

```
./cleanup
```

Note each time you run a test a new container is created.  To clean these up simply run:

```
docker container prune
```


## Sending additional arguments to Robot ##

You can send parameters as part of Robot.sh script

e.g.
```
./robot.sh -v URL:https://www.amazon.com 
```

This is sent to the container like this:

```
robot -v URL:https://www.amazon.com 
```

## Running Sample Tests

Pass a suite directory to Robot command:

```
 ./robot.sh --suite a-simple
```

Examine the /results directory after running tests to see logs, results and screenshots.

## Credits

This was original forked and heavily modified from: https://github.com/cgowez/robot-docker

Found a work around for Chrome error in headless mode here which eliminates the '--no-sandbox' option: https://github.com/Zenika/alpine-chrome

## Suggested VSCode Extensions

* [HTML Preview](https://marketplace.visualstudio.com/items?itemName=george-alisson.html-preview-vscode)
* [Robot Framework Intellisense](https://marketplace.visualstudio.com/items?itemName=TomiTurtiainen.rf-intellisense)
* [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)

## Disclaimer

* I built this for my own personal use.  YMMV. 
* It works on my system :)
* It is pitch black. You are likely to be eaten by a grue.


## License

This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <http://unlicense.org>