[![Build Status - Develop](https://travis-ci.org/IBM-Swift/swift-buildpack.svg?branch=develop)](https://travis-ci.org/IBM-Swift/swift-buildpack)

IBM Bluemix buildpack for Swift
===============================

This is the Bluemix buildpack for Swift applications, powered by the Swift Package Manager (SPM). Though this buildpack was developed mainly for Bluemix, it can be used on any Cloud Foundry environment. This buildpack requires access to the Internet for downloading and installing several system level dependencies.

Check out the [Kitura-Starter](https://github.com/IBM-Bluemix/Kitura-Starter) for a fully working example of a Kitura-based server application that can be deployed to Bluemix (or any Cloud Foundry environment).

Usage
-----

Example usage (see the [Specify a Swift version](#specify-a-swift-version) section):

```shell
$ cf push
Using manifest file /Users/olivieri/git/Kitura-Starter/manifest.yml

Creating app Kitura-Starter in org roliv@us.ibm.com / space dev as roliv@us.ibm.com...
OK

Creating route kitura-starter-nonclamorous-pekin.mybluemix.net...
OK

Binding kitura-starter-nonclamorous-pekin.mybluemix.net to Kitura-Starter...
OK

Uploading Kitura-Starter...
Uploading app files from: /Users/olivieri/git/Kitura-Starter
Uploading 56.3K, 16 files
Done uploading               
OK

Starting app Kitura-Starter in org roliv@us.ibm.com / space dev as roliv@us.ibm.com...
-----> Downloaded app package (28K)
Cloning into '/tmp/buildpacks/swift-buildpack'...
-----> Buildpack version 2.0.1
-----> Default supported Swift version is 3.0.1
-----> Configure for apt-get installs...
-----> Downloading system level dependencies...
-----> Fetching .debs for: libicu-dev libcurl4-openssl-dev
Ign http://archive.ubuntu.com trusty InRelease
Get:1 http://archive.ubuntu.com trusty-updates InRelease [65.9 kB]
Get:2 http://archive.ubuntu.com trusty-security InRelease [65.9 kB]
Get:3 http://archive.ubuntu.com trusty Release.gpg [933 B]
Get:4 http://archive.ubuntu.com trusty-updates/main amd64 Packages [1,139 kB]
Get:5 http://archive.ubuntu.com trusty-updates/universe amd64 Packages [501 kB]
Get:6 http://archive.ubuntu.com trusty-updates/multiverse amd64 Packages [16.4 kB]
Get:7 http://archive.ubuntu.com trusty Release [58.5 kB]
Get:8 http://archive.ubuntu.com trusty-security/main amd64 Packages [675 kB]
Get:9 http://archive.ubuntu.com trusty-security/universe amd64 Packages [185 kB]
Get:10 http://archive.ubuntu.com trusty-security/multiverse amd64 Packages [5,083 B]
Get:11 http://archive.ubuntu.com trusty/main amd64 Packages [1,743 kB]
Get:12 http://archive.ubuntu.com trusty/universe amd64 Packages [7,589 kB]
Get:13 http://archive.ubuntu.com trusty/multiverse amd64 Packages [169 kB]
Fetched 12.2 MB in 23s (523 kB/s)
Reading package lists...
       Reading package lists...
       Building dependency tree...
       The following extra packages will be installed:
         curl libcurl3
       Suggested packages:
         libcurl4-doc libcurl3-dbg
       The following packages will be upgraded:
         curl libcurl3 libcurl4-openssl-dev
       3 upgraded, 0 newly installed, 1 reinstalled, 0 to remove and 77 not upgraded.
       Need to get 8,129 kB of archives.
       After this operation, 1,024 B of additional disk space will be used.
       Get:1 http://archive.ubuntu.com/ubuntu/ trusty-updates/main curl amd64 7.35.0-1ubuntu2.9 [123 kB]
       Get:2 http://archive.ubuntu.com/ubuntu/ trusty-updates/main libcurl4-openssl-dev amd64 7.35.0-1ubuntu2.9 [245 kB]
       Get:4 http://archive.ubuntu.com/ubuntu/ trusty-updates/main libicu-dev amd64 52.1-3ubuntu0.4 [7,588 kB]
       Fetched 8,129 kB in 14s (551 kB/s)
       Download complete and in download only mode
-----> Downloaded DEB files...
-----> No Aptfile found.
-----> Installing system level dependencies...
-----> Installing curl_7.35.0-1ubuntu2.9_amd64.deb
-----> Installing libcurl3_7.35.0-1ubuntu2.9_amd64.deb
-----> Installing libcurl4-openssl-dev_7.35.0-1ubuntu2.9_amd64.deb
-----> Installing libicu-dev_52.1-3ubuntu0.4_amd64.deb
-----> Writing profile script...
-----> Getting swift-3.0
WARNING: Default supported Swift version: swift-3.0.1
WARNING: Requested Swift version for your app: swift-3.0
       Downloaded swift-3.0
-----> Unpacking swift-3.0.tar.gz
-----> Getting clang-3.8.0
       Downloaded clang-3.8.0
-----> Skipping cache restore (new swift signature)
-----> Building Package...
       Cloning https://github.com/IBM-Swift/Kitura.git
       HEAD is now at 43d9c17 IBM-Swift/Kitura#788 Avoid converting JSON serialized Data to String and back to Data again. (#807)
       Resolved version: 1.0.1
       Cloning https://github.com/IBM-Swift/Kitura-net.git
       HEAD is now at b61145f Merge pull request #126 from IBM-Swift/issue_784
       Resolved version: 1.0.2
       Cloning https://github.com/IBM-Swift/LoggerAPI.git
       HEAD is now at d4c1682 Regenerated API Documentation (#15)
       Resolved version: 1.0.0
       Cloning https://github.com/IBM-Swift/BlueSocket.git
       HEAD is now at 61d47f7 Update to latest (11/1) toolchain.
       Resolved version: 0.11.39
       Cloning https://github.com/IBM-Swift/CCurl.git
       HEAD is now at 3cfb752 Add header callback helper function (#9)
       Resolved version: 0.2.3
       Cloning https://github.com/IBM-Swift/CHTTPParser.git
       HEAD is now at 429eff6 Merge pull request #7 from ianpartridge/master
       Resolved version: 0.3.0
       Cloning https://github.com/IBM-Swift/BlueSSLService.git
       HEAD is now at 6659ac8 Update to latest (11/1) toolchain.
       Resolved version: 0.11.53
       Resolved version: 0.2.2
       Cloning https://github.com/IBM-Swift/CEpoll.git
       HEAD is now at 111cbcb IBM-Swift/Kitura#435 Added a README.md file
       Resolved version: 0.1.0
       Cloning https://github.com/IBM-Swift/SwiftyJSON.git
       HEAD is now at d8de7c8 Merge pull request #23 from IBM-Swift/issue_788
       Resolved version: 14.2.1
       Cloning https://github.com/IBM-Swift/Kitura-TemplateEngine.git
       HEAD is now at f013da3 Regenerated API Documentation (#8)
       Resolved version: 1.0.0
       Cloning https://github.com/IBM-Swift/HeliumLogger.git
warning: unable to rmdir Package-Builder: Directory not empty
       HEAD is now at 4a52f0b updated dependency versions in Package.swift
       Resolved version: 1.0.0
       Cloning https://github.com/IBM-Swift/Swift-cfenv.git
       HEAD is now at 3486dcb Modified parseEnvVariable() method - using now environment variables if present regardless of isLocal boolean.
       Resolved version: 1.7.1
       Cloning https://github.com/IBM-Bluemix/cf-deployment-tracker-client-swift.git
       Resolved version: 0.4.1
       Compile CHTTPParser utils.c
       Compile CHTTPParser http_parser.c
       Compile Swift Module 'Socket' (3 sources)
       Compile Swift Module 'LoggerAPI' (1 sources)
       Compile Swift Module 'SwiftyJSON' (2 sources)
       Compile Swift Module 'KituraTemplateEngine' (1 sources)
       Linking CHTTPParser
       Compile Swift Module 'SSLService' (1 sources)
       Compile Swift Module 'CloudFoundryEnv' (7 sources)
       Compile Swift Module 'KituraNet' (28 sources)
       Compile Swift Module 'CloudFoundryDeploymentTracker' (1 sources)
       Compile Swift Module 'Kitura' (40 sources)
       Compile Swift Module 'Kitura_Starter' (2 sources)
       Linking ./.build/release/Kitura-Starter
-----> Copying dynamic libraries
-----> Copying binaries to 'bin'
-----> Cleaning up build files
-----> Clearing previous swift cache
-----> Saving cache (default):
-----> Optimizing contents of cache folder
-----> Uploading droplet (29M)

0 of 1 instances running, 1 starting
1 of 1 instances running

App started


OK

App Kitura-Starter was started using this command `Kitura-Starter`

Showing health and status for app Kitura-Starter in org roliv@us.ibm.com / space dev as roliv@us.ibm.com...
OK

requested state: started
instances: 1/1
usage: 256M x 1 instances
urls: kitura-starter-nonclamorous-pekin.mybluemix.net
last uploaded: Wed Nov 2 20:58:21 UTC 2016
stack: cflinuxfs2
buildpack: swift_buildpack

     state     since                    cpu    memory          disk          details
#0   running   2016-11-02 04:03:02 PM   0.0%   29.3M of 256M   89.5M of 1G
```

The buildpack will detect your app as Swift if it has a `Package.swift` file in the root.

### Version installed on Bluemix

The latest version of the IBM Bluemix buildpack for Swift on Bluemix is [v2.0.2](https://github.com/IBM-Swift/swift-buildpack/releases/tag/2.0.2).

Please note that it is possible that the latest buildpack code contained in this repo hasn't yet been installed on Bluemix. If that happens to be the case and you'd like to leverage the latest buildpack code, you can do so by adding the `-b https://github.com/IBM-Swift/swift-buildpack` parameter to the `cf push` command, as shown below:

```shell
cf push -b https://github.com/IBM-Swift/swift-buildpack
```

### Procfile

Using the `Procfile`, you specify the name of the executable process (e.g. `Server`) to run for your web server. Any binaries built from your Swift source using SPM will be placed in your $PATH. You can also specify any runtime parameters for your process in the `Procfile`.

```
web: Server --bind 0.0.0.0:$PORT
```

### Alternative to Procfile

Instead of using the `Procfile`, you can use the `command` attribute in the `manifest.yml` of your application to specify the name of your executable. The snippet of code below shows how to use the `command` attribute to specify the same executable and parameter values used in the above `Procfile` example:

```
command: Server -bind 0.0.0.0:$PORT
```

For further details on the `command` attribute, see the [command attribute section](https://docs.cloudfoundry.org/devguide/deploy-apps/manifest.html#start-commands) on the Cloud Foundry documentation.

### Swift-cfenv

Instead of specifying IP address and port values in the `Procfile` (or in the `command` attribute) as runtime parameters to your web server process, you can instead use the [Swift-cfenv](https://github.com/IBM-Swift/Swift-cfenv) package to obtain such values at runtime. The Swift-cfenv package provides structures and methods to parse Cloud Foundry-provided environment variables, such as the port number, IP address, and URL of the application. It also provides default values when running the application locally. For details on how to leverage this library in your Swift application, see the [README](https://github.com/IBM-Swift/Swift-cfenv) file. When using Swift-cfenv in your app, your `Procfile` will be very simple; it will more than likely look like this:

```
web: <executable_name>
```

If instead of the `Procfile`, you are using the `command` attribute in your application's `manifest.yml` file, then the entry for the `command` attribute is simplified to:

```
command: <executable_name>
```

### What is the latest version of Swift supported?

The latest version of Swift supported by this buildpack is ```3.0.1```.

### Specify a Swift version

You specify the version of Swift for your application using a `.swift-version` file in the root of your repository:

```shell
$ cat .swift-version
3.0.1
```

Please note that the swift_buildpack installed on Bluemix **caches** the following versions of the Swift binaries:

- `3.0.1`
- `3.0`

If you'd like to use a different version of Swift [that is not cached] on Bluemix, you can specify it in the `.swift-version` file.  Please be aware that using a Swift version that is not cached increases the provisioning time of your app on Bluemix.

The [manifest.yml](https://github.com/IBM-Swift/swift-buildpack/blob/develop/manifest.yml) file contains the complete list of the Swift versions that are cached on Bluemix.

Since there are frequent Swift language changes, it's advised that you pin your application to a specific Swift version. Once you have tested and migrated your code to a newer version of Swift, you can then update the `.swift-version` file with the appropriate Swift version.

### Installing additional system level dependencies
Many Swift applications will not require the installation of any additional libraries. It's very common for today’s applications to have dependencies only on services that provide REST interfaces to interact with them (e.g., Cloudant, AlchemyAPI, Personality Insights, etc.).

However, since dependencies vary from application to application, there could be cases when additional system packages may be required to compile and/or execute a Swift application. To address this need, the IBM Bluemix buildpack for Swift supports the installation of Ubuntu trusty packages using the `apt-get` utility. You can specify the Ubuntu packages that the should be installed by including an `Aptfile` in the root directory of your Swift application. Each line in the Aptfile should contain a valid Ubuntu package name. For instance, if your application has a dependency on the `libmysqlclient-dev` package, then your Aptfile should look like this:

```shell
$ cat Aptfile
libmysqlclient-dev
```

### Additional compiler flags

To specify additional compiler flags for the execution of the `swift build` command, you can include a `.swift-build-options-linux` file. For example, in order to leverage the system package `libmysqlclient-dev` in a Swift application, you'd need an additional compiler flag:

```shell
$ cat .swift-build-options-linux
-Xswiftc -DNOJSON
```

Here's another example of the contents that can be added to the `.swift-build-options-linux` file:

```shell
$ cat .swift-build-options-linux
-Xcc -I$BUILD_DIR/.apt/usr/include/postgresql
```

The compiler flag shown in the above example is required when leveraging the PostgreSQL system library `libpq-dev`.

### System level libraries

This buildpack installs the following Ubuntu 14.04 system libraries:

- libicu-dev
- libcurl4-openssl-dev

### libdispatch

Previous versions of this buildpack provided the [libdispatch](https://github.com/apple/swift-corelibs-libdispatch) binaries for Swift development builds **prior** to 2016-08-23. However, current and future versions of this buildpack will **not** provide those binaries. Users should upgrade their applications to Swift 3.0, which already includes the libdispatch binaries.

### Caching of the Packages folder

You should know the Bluemix buildpack for Swift will cache the contents of the `Packages` folder to speed up the provisioning of your application the next time you execute the `cf push` command. If you'd prefer not to use this caching mechanism, you can disable it by executing the following command:

```shell
cf set-env <app_name> SWIFT_PACKAGES_CACHE false
cf restage <app_name>
```

If at some point, you'd like to re-enable caching of the `Packages` folder, you can do so by executing:

```shell
cf set-env <app_name> SWIFT_PACKAGES_CACHE true
cf restage <app_name>
```

Note that if at some point you change the contents of your `Package.swift` file, the buildpack will automatically refetch the dependencies and update the cache accordingly.

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

```shell
wget https://github.com/IBM-Swift/swift-buildpack/releases/download/v2.0.2/buildpack_swift_v2.0.2-20160915-1220.zip
cf create-buildpack swift_buildpack buildpack_swift_v2.0.2-20160915-1220.zip <position>
```

And to update it:

```shell
wget https://github.com/IBM-Swift/swift-buildpack/releases/download/v2.0.2/buildpack_swift_v2.0.2-20160915-1220.zip
cf update-buildpack swift_buildpack -p buildpack_swift_v2.0.2-20160915-1220.zip
```

For more details on installing buildpacks, see [Adding buildpacks to Cloud Foundry](https://docs.cloudfoundry.org/adminguide/buildpacks.html).

Packaging
---------
The buildpack zip file provided in each release is built using the `manifest.yml` file:

```shell
BUNDLE_GEMFILE=cf.Gemfile bundle install
BUNDLE_GEMFILE=cf.Gemfile bundle exec buildpack-packager --cached --use-custom-manifest manifest.yml
```

For details on packaging buildpacks, see [buildpack-packager](https://github.com/cloudfoundry/buildpack-packager).
