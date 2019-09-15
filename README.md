# README

Lightweight Alpine Docker container that runs Robot Framework using Selenium Chrome (Chromium) driver in native headless mode (no Xvfb required).

## What is this repository for?

This repository has a Dockerfile that creates a container to run Robot Framework scripts locally, avoiding the hassles of setting up Python and Robot Framework locally.

### Versioning

* robotframework: latest
* robotframework-seleniumlibrary: latest
* robotframework-faker: latest
* Chrome webdriver: latest
* Chromium browser: latest

### Pre-requisites

Docker should be already installed and running.


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

## Cleanup

```
./remove
```

Remove any container and images related to this Dockerfile!  After running this you will need to rebuild your image.


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

## Credits

This was original forked and heavily modified from: https://github.com/cgowez/robot-docker

Found a work around for Chrome error in headless mode here which eliminates the '--no-sandbox' option: https://github.com/Zenika/alpine-chrome

## Disclaimer

* I build this mainly to use for my own personal use.  YMMV. 
* It works on my system :)
* It is pitch black. You are likely to be eaten by a grue.
