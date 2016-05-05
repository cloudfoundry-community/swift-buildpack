Bluemix buildpack for Swift
===========================

This is the Bluemix buildpack for Swift applications, powered by the Swift Package Manager (SPM). Though this buildpack was developed mainly for Bluemix, it can be used on any Cloud Foundry environment. This buildpack requires access to the Internet for downloading and installing several system level dependencies.

Please note that this buildpack is **not** yet installed on Bluemix; our team is working on getting it installed soon. Having said that, you can still use this buildpack to deploy your Swift applications to Bluemix as described in the ```Usage``` section below.

Also, check out the [Kitura-Starter-Bluemix](https://github.com/IBM-Swift/Kitura-Starter-Bluemix) for a fully working example of a Kitura-based server application that can be deployed to Bluemix (or any Cloud Foundry environment).

Usage
-----

Example usage:

```shell
$ cf push -b https://github.com/IBM-Swift/swift-buildpack.git
Using manifest file /Users/olivieri/git/Kitura-Starter-Bluemix/manifest.yml

Creating app Kitura-Starter-Bluemix in org roliv@us.ibm.com / space dev as roliv@us.ibm.com...
OK

Creating route kitura-starter-bluemix-nonadapting-disguisedness.mybluemix.net...
OK

Binding kitura-starter-bluemix-nonadapting-disguisedness.mybluemix.net to Kitura-Starter-Bluemix...
OK

Uploading Kitura-Starter-Bluemix...
Uploading app files from: /Users/olivieri/git/Kitura-Starter-Bluemix
Uploading 50.4K, 36 files
Done uploading               
OK

Starting app Kitura-Starter-Bluemix in org roliv@us.ibm.com / space dev as roliv@us.ibm.com...
-----> Downloaded app package (28K)
Cloning into '/tmp/buildpacks/swift-buildpack'...
-----> Installing system level dependencies...
Get:1 http://security.ubuntu.com trusty-security InRelease [65.9 kB]
Ign http://archive.ubuntu.com trusty InRelease
Get:2 http://archive.ubuntu.com trusty-updates InRelease [65.9 kB]
Get:3 http://security.ubuntu.com trusty-security/main amd64 Packages [574 kB]
Get:4 http://security.ubuntu.com trusty-security/universe amd64 Packages [165 kB]
Get:5 http://security.ubuntu.com trusty-security/multiverse amd64 Packages [4,855 B]
Get:6 http://archive.ubuntu.com trusty Release.gpg [933 B]
Get:7 http://archive.ubuntu.com trusty-updates/main amd64 Packages [950 kB]
Get:8 http://archive.ubuntu.com trusty-updates/universe amd64 Packages [464 kB]
Get:9 http://archive.ubuntu.com trusty-updates/multiverse amd64 Packages [14.3 kB]
Get:10 http://archive.ubuntu.com trusty Release [58.5 kB]
Get:11 http://archive.ubuntu.com trusty/main amd64 Packages [1,743 kB]
Get:12 http://archive.ubuntu.com trusty/universe amd64 Packages [7,589 kB]
Get:13 http://archive.ubuntu.com trusty/multiverse amd64 Packages [169 kB]
Reading package lists...
       Reading package lists...
       Building dependency tree...
       The following extra packages will be installed:
         curl libblocksruntime0 libcurl4-openssl-dev
       Suggested packages:
         libcurl4-doc libcurl3-dbg
       The following NEW packages will be installed:
         libblocksruntime-dev libblocksruntime0 libkqueue0
       The following packages will be upgraded:
         curl libcurl3 libcurl4-openssl-dev
       3 upgraded, 3 newly installed, 0 to remove and 134 not upgraded.
       Need to get 577 kB of archives.
       After this operation, 219 kB of additional disk space will be used.
       Get:1 http://archive.ubuntu.com/ubuntu/ trusty-updates/main curl amd64 7.35.0-1ubuntu2.6 [123 kB]
       Get:2 http://archive.ubuntu.com/ubuntu/ trusty-updates/main libcurl4-openssl-dev amd64 7.35.0-1ubuntu2.6 [245 kB]
       Get:3 http://archive.ubuntu.com/ubuntu/ trusty-updates/main libcurl3 amd64 7.35.0-1ubuntu2.6 [172 kB]
       Get:4 http://archive.ubuntu.com/ubuntu/ trusty/universe libblocksruntime0 amd64 0.1-1 [8,128 B]
       Get:5 http://archive.ubuntu.com/ubuntu/ trusty/universe libblocksruntime-dev amd64 0.1-1 [4,660 B]
       Get:6 http://archive.ubuntu.com/ubuntu/ trusty/universe libkqueue0 amd64 1.0.4-2ubuntu1 [23.4 kB]
       Fetched 577 kB in 2s (266 kB/s)
       Download complete and in download only mode
-----> Downloaded DEB files...
-----> Installing curl_7.35.0-1ubuntu2.6_amd64.deb
-----> Installing libblocksruntime0_0.1-1_amd64.deb
-----> Installing libblocksruntime-dev_0.1-1_amd64.deb
-----> Installing libcurl3_7.35.0-1ubuntu2.6_amd64.deb
-----> Installing libcurl4-openssl-dev_7.35.0-1ubuntu2.6_amd64.deb
-----> Installing libkqueue0_1.0.4-2ubuntu1_amd64.deb
-----> Writing profile script...
-----> Buildpack version 1.1.0
-----> Installing Swift DEVELOPMENT-SNAPSHOT-2016-04-25-a
       Downloaded Swift
-----> Installing Clang 3.7.0
       Downloaded Clang
-----> Adding libdispatch binaries...
-----> Building Package...
       Cloning https://github.com/IBM-Swift/Kitura.git
       Resolved version: 0.11.3
       Cloning https://github.com/IBM-Swift/Kitura-net.git
       Resolved version: 0.11.6
       Cloning https://github.com/IBM-Swift/Kitura-sys.git
       Resolved version: 0.11.0
       Cloning https://github.com/IBM-Swift/LoggerAPI.git
       Resolved version: 0.5.1
       Cloning https://github.com/IBM-Swift/BlueSocket.git
       Resolved version: 0.5.2
       Cloning https://github.com/IBM-Swift/CCurl.git
       Resolved version: 0.1.1
       Cloning https://github.com/IBM-Swift/CHttpParser.git
       Resolved version: 0.1.1
       Cloning https://github.com/IBM-Swift/SwiftyJSON.git
       Resolved version: 6.1.0
       Cloning https://github.com/IBM-Swift/Kitura-TemplateEngine.git
       Resolved version: 0.9.0
       Cloning https://github.com/IBM-Swift/HeliumLogger.git
       Resolved version: 0.6.2
       Cloning https://github.com/IBM-Swift/Swift-cfenv
       Resolved version: 0.0.4
       mkdir -p /tmp/staged/app/.build/release/CHttpParser.build
       Compile LoggerAPI
       Compile Socket
       Compile SwiftyJSON
       Compile Kitura-TemplateEngine
       Compile CHttpParser utils.c
       Compile CHttpParser http_parser.c
       Compile KituraSys
       Compile HeliumLogger
       Linking CHttpParser
       Compile KituraNet
       Compile CFEnvironment
       Compile Kitura
       Compile Kitura-Starter-Bluemix
       Linking .build/release/Kitura-Starter-Bluemix
-----> Copying dynamic libraries
-----> Copying binaries to 'bin'
-----> Cleaning up build files
-----> Uploading droplet (8.7M)

0 of 1 instances running, 1 starting
1 of 1 instances running

App started


OK

App Kitura-Starter-Bluemix was started using this command `Kitura-Starter-Bluemix`

Showing health and status for app Kitura-Starter-Bluemix in org roliv@us.ibm.com / space dev as roliv@us.ibm.com...
OK

requested state: started
instances: 1/1
usage: 256M x 1 instances
urls: kitura-starter-bluemix-nonadapting-disguisedness.mybluemix.net
last uploaded: Thu May 5 18:09:46 UTC 2016
stack: unknown
buildpack: https://github.com/IBM-Swift/swift-buildpack

     state     since                    cpu    memory          disk          details   
#0   running   2016-05-05 01:14:58 PM   0.0%   12.8M of 256M   30.3M of 1G      
$
```

The buildpack will detect your app as Swift if it has a `Package.swift` file in the root.

### Procfile

Using the `Procfile`, you can specify the name of executable process (e.g. `Server`) to run for your web server. Any binaries built from your Swift source using SPM will be placed in your $PATH. You can also specify any runtime parameters for your process in the `Procfile`.

```
web: Server --bind 0.0.0.0:$PORT
```

### Swift-cfenv

Instead of specifying IP address and port values in the `Procfile` as runtime parameters to your web server process, you can instead use the [Swift-cfenv](https://github.com/IBM-Swift/Swift-cfenv) package to obtain such values at runtime. The Swift-cfenv package provides structures and methods to parse Cloud Foundry-provided environment variables, such as the port number, IP address, and URL of the application. It also provides default values when running the application locally. For details on how to leverage this library in your Swift application, see the [README](https://github.com/IBM-Swift/Swift-cfenv) file. When using Swift-cfenv in your app, your `Procfile` will be very simple; it will more than likely look like this:

```
web: <executable_name>
```

### What is the latest version of Swift supported?

The latest version of Swift supported by this buildpack is ```swift-DEVELOPMENT-SNAPSHOT-2016-05-03-a```.

### Specify a Swift version

You can also customize the version of Swift used with a `.swift-version` file in your repository:

```shell
$ cat .swift-version
swift-DEVELOPMENT-SNAPSHOT-2016-05-03-a
```

For a list of the Swift supported versions, check out the [manifest.yml](https://github.com/IBM-Swift/swift-buildpack/blob/bluemix-buildpack/manifest.yml) file. Since there are frequent Swift language changes, it's advised that you pin your application to a specific Swift version. Once you have tested and migrated your code to a newer version of Swift, you can then update the `.swift-version` file with the appropriate Swift version.

### System level libraries

This buildpack installs the following system libraries:

- libcurl3
- libblocksruntime-dev
- libkqueue0

Once Foundation (Linux) provides complete networking functionality and [`libdispatch`](#libdispatch) is bundled up with the Swift binaries, there won't be a need for installing these system libraries.

### libdispatch

As yet, the Swift binaries (for Linux) do not include the [libdispatch](https://github.com/apple/swift-corelibs-libdispatch) library. It is expected that this library will be fully integrated with the Swift binaries at some point later this year. As a stopgap solution, this buildpack includes the libdispatch binaries for the following Swift versions:

- swift-DEVELOPMENT-SNAPSHOT-2016-03-24-a
- swift-DEVELOPMENT-SNAPSHOT-2016-04-25-a
- swift-DEVELOPMENT-SNAPSHOT-2016-05-03-a

### Debugging

If the buildpack preparation or compilation steps are failing, you can enable some debugging using the following command:

```shell
cf set-env <app_name> BP_DEBUG true
```

To deactivate:

```shell
cf unset-env <app_name> BP_DEBUG
```

Admin tasks
-----------

To install this buildpack:
```
wget https://github.com/IBM-Swift/swift-buildpack/releases/download/v1.1.0/swift_buildpack-cached-v1.1.0.zip
cf create-buildpack swift_buildpack swift_buildpack-cached-v1.1.0.zip <position>
```

And to update it:

```
wget https://github.com/IBM-Swift/swift-buildpack/releases/download/v1.1.0/swift_buildpack-cached-v1.1.0.zip
cf update-buildpack swift_buildpack -p swift_buildpack-cached-v1.1.0.zip
```

For more details on installing buildpacks, see [Adding buildpacks to Cloud Foundry](https://docs.cloudfoundry.org/adminguide/buildpacks.html).

Packaging
---------
The buildpack zip file provided in each release is built using `manifest-cached.yml` file:

```shell
BUNDLE_GEMFILE=cf.Gemfile bundle install
BUNDLE_GEMFILE=cf.Gemfile bundle exec buildpack-packager --cached --use-custom-manifest manifest-cached.yml
```
For details on packaging buildpacks, see [buildpack-packager](https://github.com/cloudfoundry/buildpack-packager).
