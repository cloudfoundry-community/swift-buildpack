Bluemix buildpack for Swift
===========================

This is the Bluemix buildpack for Swift applications, powered by the Swift Package Manager (SPM). Though this buildpack was developed mainly for Bluemix, it can be used on any Cloud Foundry environment. This buildpack requires access to the Internet for downloading and installing several system level dependencies.

Check out the [Kitura-Starter-Bluemix](https://github.com/IBM-Swift/Kitura-Starter-Bluemix) for a fully working example of a Kitura-based server application that can be deployed to Bluemix (or any Cloud Foundry environment).

Usage
-----

Example usage:

```shell
$ cf push
Using manifest file /Users/olivieri/git/Kitura-Starter-Bluemix/manifest.yml

Creating app Kitura-Starter-Bluemix in org roliv@us.ibm.com / space dev as roliv@us.ibm.com...
OK

Creating route kitura-starter-bluemix-bacterial-spa.mybluemix.net...
OK

Binding kitura-starter-bluemix-bacterial-spa.mybluemix.net to Kitura-Starter-Bluemix...
OK

Uploading Kitura-Starter-Bluemix...
Uploading app files from: /Users/olivieri/git/Kitura-Starter-Bluemix
Uploading 52K, 36 files
Done uploading               
OK

Starting app Kitura-Starter-Bluemix in org roliv@us.ibm.com / space dev as roliv@us.ibm.com...
-----> Downloaded app package (28K)
Cloning into '/tmp/buildpacks/swift-buildpack'...
-----> Installing system level dependencies...
Ign http://archive.ubuntu.com trusty InRelease
Get:1 http://archive.ubuntu.com trusty-updates InRelease [65.9 kB]
Get:2 http://archive.ubuntu.com trusty-security InRelease [65.9 kB]
Get:3 http://archive.ubuntu.com trusty Release.gpg [933 B]
Get:4 http://archive.ubuntu.com trusty-updates/main amd64 Packages [979 kB]
Get:5 http://archive.ubuntu.com trusty-updates/universe amd64 Packages [468 kB]
Get:6 http://archive.ubuntu.com trusty-updates/multiverse amd64 Packages [14.3 kB]
Get:7 http://archive.ubuntu.com trusty Release [58.5 kB]
Get:8 http://archive.ubuntu.com trusty-security/main amd64 Packages [618 kB]
Get:9 http://archive.ubuntu.com trusty-security/universe amd64 Packages [169 kB]
Get:10 http://archive.ubuntu.com trusty-security/multiverse amd64 Packages [4,857 B]
Get:11 http://archive.ubuntu.com trusty/main amd64 Packages [1,743 kB]
Get:12 http://archive.ubuntu.com trusty/universe amd64 Packages [7,589 kB]
Get:13 http://archive.ubuntu.com trusty/multiverse amd64 Packages [169 kB]
Fetched 11.9 MB in 15s (772 kB/s)
Reading package lists...
       Reading package lists...
       Building dependency tree...
       The following extra packages will be installed:
         libblocksruntime0 libssl1.0.0
       Recommended packages:
         libssl-doc
       The following NEW packages will be installed:
         libblocksruntime-dev libblocksruntime0 libkqueue0
       The following packages will be upgraded:
         libssl-dev libssl1.0.0 openssl
       3 upgraded, 3 newly installed, 1 reinstalled, 0 to remove and 104 not upgraded.
       Need to get 2,600 kB of archives.
       After this operation, 229 kB of additional disk space will be used.
       Get:1 http://archive.ubuntu.com/ubuntu/ trusty-updates/main libssl-dev amd64 1.0.1f-1ubuntu2.19 [1,073 kB]
       Get:2 http://archive.ubuntu.com/ubuntu/ trusty-updates/main libssl1.0.0 amd64 1.0.1f-1ubuntu2.19 [828 kB]
       Get:3 http://archive.ubuntu.com/ubuntu/ trusty-updates/main libcurl3 amd64 7.35.0-1ubuntu2.6 [172 kB]
       Get:4 http://archive.ubuntu.com/ubuntu/ trusty-updates/main openssl amd64 1.0.1f-1ubuntu2.19 [490 kB]
       Get:6 http://archive.ubuntu.com/ubuntu/ trusty/universe libblocksruntime-dev amd64 0.1-1 [4,660 B]
       Get:7 http://archive.ubuntu.com/ubuntu/ trusty/universe libkqueue0 amd64 1.0.4-2ubuntu1 [23.4 kB]
       Fetched 2,600 kB in 5s (460 kB/s)
       Download complete and in download only mode
-----> Downloaded DEB files...
-----> Installing libblocksruntime0_0.1-1_amd64.deb
-----> Installing libblocksruntime-dev_0.1-1_amd64.deb
-----> Installing libcurl3_7.35.0-1ubuntu2.6_amd64.deb
-----> Installing libkqueue0_1.0.4-2ubuntu1_amd64.deb
-----> Installing libssl1.0.0_1.0.1f-1ubuntu2.19_amd64.deb
-----> Installing libssl-dev_1.0.1f-1ubuntu2.19_amd64.deb
-----> Installing openssl_1.0.1f-1ubuntu2.19_amd64.deb
-----> Writing profile script...
-----> Buildpack version 1.1.3
-----> Installing Swift DEVELOPMENT-SNAPSHOT-2016-06-06-a
       Downloaded Swift
-----> Installing Clang 3.7.0
       Downloaded Clang
-----> Adding libdispatch binaries...
-----> Building Package...
       Cloning https://github.com/IBM-Swift/Kitura.git
       HEAD is now at 1163072 IBM-Swift/Kitura#551 Made members public
       Resolved version: 0.19.2
       Cloning https://github.com/IBM-Swift/Kitura-net.git
       HEAD is now at c18958a Migrated to 05-31 swift snapshot (#36)
       Resolved version: 0.19.0
       Cloning https://github.com/IBM-Swift/Kitura-sys.git
       HEAD is now at 81b9b3b Updated dependency version
       Resolved version: 0.17.1
       Cloning https://github.com/IBM-Swift/LoggerAPI.git
       HEAD is now at 9b30704 Merge pull request #8 from tkhuran/develop
       Resolved version: 0.8.0
       Cloning https://github.com/IBM-Swift/BlueSocket.git
       HEAD is now at 6e8915c Added blurb about BlueSSLService add-on.
       Resolved version: 0.5.20
       Cloning https://github.com/IBM-Swift/CCurl.git
       HEAD is now at 3330699 Removed use of pkgConfig and added system declaration
       Resolved version: 0.2.1
       Cloning https://github.com/IBM-Swift/CHTTPParser.git
       HEAD is now at 41daabb IBM-Swift/Kitura#365 Removed references to code installed externally and the pkgConfig file that is no longer needed.
       Resolved version: 0.1.1
       Cloning https://github.com/IBM-Swift/SwiftyJSON.git
       HEAD is now at 3dc35da IBM-Swift/Kitura#504 updates to work on linux os for 31-05 migration (#5)
       Resolved version: 9.0.0
       Cloning https://github.com/IBM-Swift/Kitura-TemplateEngine.git
       HEAD is now at 1fe55ef Merge remote-tracking branch 'origin/develop'
       Resolved version: 0.16.0
       Cloning https://github.com/IBM-Swift/HeliumLogger.git
       HEAD is now at 5bf434a Merge remote-tracking branch 'origin/develop'
       Resolved version: 0.10.0
       Cloning https://github.com/IBM-Swift/Swift-cfenv
       HEAD is now at eefdf83 Migrating code to swift 06-06.
       Resolved version: 1.3.0
       Compile CHttpParser utils.c
       Compile CHttpParser http_parser.c
       Compile Swift Module 'LoggerAPI' (1 sources)
       Compile Swift Module 'Socket' (3 sources)
       Compile Swift Module 'SwiftyJSON' (2 sources)
       Compile Swift Module 'KituraTemplateEngine' (1 sources)
       clang-3.7: warning: argument unused during compilation: '-Xcc'
       clang-3.7: warning: argument unused during compilation: '-Xcc'
       Compile Swift Module 'KituraSys' (3 sources)
       Compile Swift Module 'HeliumLogger' (1 sources)
       clang-3.7: warning: argument unused during compilation: '-Xcc'
       clang-3.7: warning: argument unused during compilation: '-Xcc'
       Linking CHttpParser
       Compile Swift Module 'KituraNet' (12 sources)
       Compile Swift Module 'CloudFoundryEnv' (7 sources)
       Compile Swift Module 'Kitura' (35 sources)
       /tmp/staged/app/Packages/Kitura-0.19.2/Sources/Kitura/staticFileServer/FileServer.swift:105:17: warning: result of call to 'serveIfNonDirectoryFile(atPath:response:)' is unused
                       serveIfNonDirectoryFile(atPath: filePathWithExtension, response: response)
                       ^                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       Compile Swift Module 'Kitura_Starter_Bluemix' (1 sources)
       Linking .build/release/Kitura-Starter-Bluemix
-----> Copying dynamic libraries
-----> Copying binaries to 'bin'
-----> Cleaning up build files
-----> Cleaning up cache folder
-----> Uploading droplet (13M)

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
urls: kitura-starter-bluemix-bacterial-spa.mybluemix.net
last uploaded: Fri Jun 24 04:10:33 UTC 2016
stack: unknown
buildpack: https://github.com/IBM-Swift/swift-buildpack.git#develop

     state     since                    cpu    memory          disk          details   
#0   running   2016-06-23 11:15:01 PM   0.0%   13.1M of 256M   43.2M of 1G      
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

The latest version of Swift supported by this buildpack is ```swift-DEVELOPMENT-SNAPSHOT-2016-06-06-a```.

### Specify a Swift version

The swift_buildpack installed on Bluemix supports the DEVELOPMENT-SNAPSHOT-2016-06-06-a version of the Swift binaries. If you'd like to use a different version of Swift on Bluemix for your application, you'll need to specify the version with a `.swift-version` file in the root of your repository:

```shell
$ cat .swift-version
swift-DEVELOPMENT-SNAPSHOT-2016-04-25-a
```

In addition to including a `.swift-version` file, you'll also need to add the `-b https://github.com/IBM-Swift/swift-buildpack` parameter to the `cf push` command, as shown below:

```shell
cf push -b https://github.com/IBM-Swift/swift-buildpack
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
- swift-DEVELOPMENT-SNAPSHOT-2016-06-06-a

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
wget https://github.com/IBM-Swift/swift-buildpack/releases/download/v1.1.3/swift_buildpack-cached-v1.1.0.zip
cf create-buildpack swift_buildpack swift_buildpack-cached-v1.1.3.zip <position>
```

And to update it:

```
wget https://github.com/IBM-Swift/swift-buildpack/releases/download/v1.1.3/swift_buildpack-cached-v1.1.0.zip
cf update-buildpack swift_buildpack -p swift_buildpack-cached-v1.1.3.zip
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
