Bluemix buildpack for Swift
===========================

This is the Bluemix buildpack for Swift applications, powered by the Swift Package Manager (SPM). Though this buildpack was developed mainly for Bluemix, it can be used on any Cloud Foundry environment. This buildpack requires access to the Internet for downloading and installing several system level dependencies.

Check out the [Kitura-Starter-Bluemix](https://github.com/IBM-Swift/Kitura-Starter-Bluemix) for a fully working example of a Kitura-based server application that can be deployed to Bluemix (or any Cloud Foundry environment).

Usage
-----

Example usage (see the [Specify a Swift version](#specify-a-swift-version) section):

```shell
$ cf push
Using manifest file /Users/olivieri/git/Kitura-Starter-Bluemix/manifest.yml

Creating app Kitura-Starter-Bluemix in org roliv@us.ibm.com / space dev as roliv@us.ibm.com...
OK

Creating route kitura-starter-bluemix-peculiar-forethought.mybluemix.net...
OK

Binding kitura-starter-bluemix-peculiar-forethought.mybluemix.net to Kitura-Starter-Bluemix...
OK

Uploading Kitura-Starter-Bluemix...
Uploading app files from: /Users/olivieri/git/Kitura-Starter-Bluemix
Uploading 24.4K, 16 files
Done uploading               
OK

Starting app Kitura-Starter-Bluemix in org roliv@us.ibm.com / space dev as roliv@us.ibm.com...
-----> Downloaded app package (12K)
Cloning into '/tmp/buildpacks/swift-buildpack'...
-----> Installing libblocksruntime0_0.1-1_amd64.deb
-----> Installing libblocksruntime-dev_0.1-1_amd64.deb
-----> Installing libkqueue0_1.0.4-2ubuntu1_amd64.deb
-----> Installing libssl-dev_1.0.1f-1ubuntu2.19_amd64.deb
-----> Installing openssl_1.0.1f-1ubuntu2.19_amd64.deb
-----> Installing uuid-dev_2.20.1-5.1ubuntu20_amd64.deb
-----> No Aptfile found.
-----> Writing profile script...
-----> Installing Swift DEVELOPMENT-SNAPSHOT-2016-07-25-a
       Downloaded Swift
-----> Installing Clang 3.8.0
       Downloaded Clang
-----> Adding libdispatch binaries...
-----> Building Package...
       Cloning https://github.com/IBM-Swift/Kitura.git
       HEAD is now at f59a1a4 Update .travis.yml (#698)
       Resolved version: 0.26.1
       Cloning https://github.com/IBM-Swift/Kitura-net.git
       HEAD is now at e312591 updated dependency versions in Package.swift
       Resolved version: 0.26.0
       Cloning https://github.com/IBM-Swift/Kitura-sys.git
warning: unable to rmdir Package-Builder: Directory not empty
warning: unable to rmdir Package-Builder: Directory not empty
       HEAD is now at 67737a2 Migration 0725 (#10)
       Resolved version: 0.26.0
       Cloning https://github.com/IBM-Swift/LoggerAPI.git
       HEAD is now at 98a5abd IBM-Swift/Kitura#646 - Added entry/exit logging (#11)
       Resolved version: 0.10.0
       Cloning https://github.com/IBM-Swift/BlueSocket.git
       HEAD is now at 3c6b4fc Minor formatting errors as a result of the merge.
       Resolved version: 0.7.6
       Cloning https://github.com/IBM-Swift/CCurl.git
       HEAD is now at 3330699 Removed use of pkgConfig and added system declaration
       Resolved version: 0.2.1
       Cloning https://github.com/IBM-Swift/CHTTPParser.git
       HEAD is now at 429eff6 Merge pull request #7 from ianpartridge/master
       Resolved version: 0.3.0
       Cloning https://github.com/IBM-Swift/CEpoll.git
       HEAD is now at 111cbcb IBM-Swift/Kitura#435 Added a README.md file
       Resolved version: 0.1.0
       Cloning https://github.com/IBM-Swift/SwiftyJSON.git
       HEAD is now at 57621b4 Migration 0725 (#12)
       Resolved version: 11.0.0
       Cloning https://github.com/IBM-Swift/Kitura-TemplateEngine.git
warning: unable to rmdir Package-Builder: Directory not empty
       HEAD is now at 6445fb7 DEVELOPMENT-SNAPSHOT-2016-07-25-a
       Resolved version: 0.26.0
       Cloning https://github.com/IBM-Swift/HeliumLogger.git
       HEAD is now at 333af58 Migration 0725 (#17)
       Resolved version: 0.14.0
       Cloning https://github.com/IBM-Swift/Swift-cfenv.git
warning: unable to rmdir Kitura-Build: Directory not empty
       HEAD is now at 809b1b6 Merge pull request #16 from IBM-Swift/migrate_0725
       Resolved version: 1.5.0
       Cloning https://github.com/IBM-Bluemix/cf-deployment-tracker-client-swift.git
       HEAD is now at bbfc5de Updated readme to reflect the 07-25 version
       Resolved version: 0.2.1
       Compile CHTTPParser http_parser.c
       Compile CHTTPParser utils.c
       Compile Swift Module 'Socket' (3 sources)
       Compile Swift Module 'LoggerAPI' (1 sources)
       Compile Swift Module 'SwiftyJSON' (2 sources)
       Compile Swift Module 'KituraTemplateEngine' (1 sources)
       Compile Swift Module 'KituraSys' (3 sources)
       Compile Swift Module 'HeliumLogger' (1 sources)
       Linking CHTTPParser
       Compile Swift Module 'KituraNet' (29 sources)
       Compile Swift Module 'CloudFoundryEnv' (7 sources)
       Compile Swift Module 'CloudFoundryDeploymentTracker' (1 sources)
       Compile Swift Module 'Kitura' (38 sources)
       Compile Swift Module 'Kitura_Starter_Bluemix' (1 sources)
       Linking ./.build/release/Kitura-Starter-Bluemix
-----> Copying dynamic libraries
-----> Copying binaries to 'bin'
-----> Cleaning up cache folder
-----> Uploading droplet (15M)

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
urls: kitura-starter-bluemix-peculiar-forethought.mybluemix.net
last uploaded: Fri Aug 26 18:04:38 UTC 2016
stack: cflinuxfs2

     state     since                    cpu    memory          disk          details
#0   running   2016-08-26 01:07:47 PM   0.0%   15.6M of 256M   48.6M of 1G    
```

The buildpack will detect your app as Swift if it has a `Package.swift` file in the root.

### Version installed on Bluemix

The latest version installed on Bluemix is (v1.1.6)[https://github.com/IBM-Swift/swift-buildpack/releases/tag/1.1.5].

Please note that it is possible that the latest buildpack code contained in this repo hasn't yet been installed on Bluemix. If that happens to be the case and you'd like to leverage the latest buildpack code you can do so by adding the `-b https://github.com/IBM-Swift/swift-buildpack` parameter to the `cf push` command, as shown below:

```shell
cf push -b https://github.com/IBM-Swift/swift-buildpack
```

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

The latest version of Swift supported by this buildpack is ```swift-DEVELOPMENT-SNAPSHOT-2016-08-31-a```.

### Specify a Swift version

You specify the version of Swift for your application using a `.swift-version` file in the root of your repository:

```shell
$ cat .swift-version
swift-DEVELOPMENT-SNAPSHOT-2016-08-31-a
```

Please note that the swift_buildpack installed on Bluemix **caches** the following versions of the Swift binaries:

- `DEVELOPMENT-SNAPSHOT-2016-08-31-a`
- `DEVELOPMENT-SNAPSHOT-2016-07-25-a`
- `DEVELOPMENT-SNAPSHOT-2016-06-06-a`

If you'd like to use a different version of Swift [that is not cached] on Bluemix, you should specify it in the `.swift-version` file.  Please be aware that using a Swift version that is not cached increases the provisioning time of your app on Bluemix.

The [manifest.yml](https://github.com/IBM-Swift/swift-buildpack/blob/bluemix-buildpack/manifest.yml) file contains the complete list of the Swift versions that are cached on Bluemix.

Since there are frequent Swift language changes, it's advised that you pin your application to a specific Swift version. Once you have tested and migrated your code to a newer version of Swift, you can then update the `.swift-version` file with the appropriate Swift version.

### System level libraries

This buildpack installs the following system libraries:

- libcurl3
- libblocksruntime-dev
- libkqueue0
- openssl
- libssl-dev

Once Foundation (Linux) provides complete networking functionality and [`libdispatch`](#libdispatch) is bundled up with the Swift binaries, there won't be a need for installing the above system libraries.

### libdispatch

The Swift binaries (for Linux) prior to 2016-08-23 do not include the [libdispatch](https://github.com/apple/swift-corelibs-libdispatch) library. Therefore, this buildpack adds the libdispatch binaries for the following Swift versions:

- `swift-DEVELOPMENT-SNAPSHOT-2016-08-18-a`
- `swift-DEVELOPMENT-SNAPSHOT-2016-08-07-a`
- `swift-DEVELOPMENT-SNAPSHOT-2016-08-04-a`
- `swift-DEVELOPMENT-SNAPSHOT-2016-07-25-a`
- `swift-DEVELOPMENT-SNAPSHOT-2016-06-20-a`
- `swift-DEVELOPMENT-SNAPSHOT-2016-06-06-a`
- `swift-DEVELOPMENT-SNAPSHOT-2016-05-03-a`
- `swift-DEVELOPMENT-SNAPSHOT-2016-04-25-a`
- `swift-DEVELOPMENT-SNAPSHOT-2016-03-24-a`

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
wget https://github.com/IBM-Swift/swift-buildpack/releases/download/v1.1.11/swift_buildpack-cached-v1.1.11.zip
cf create-buildpack swift_buildpack swift_buildpack-cached-v1.1.11.zip <position>
```

And to update it:

```
wget https://github.com/IBM-Swift/swift-buildpack/releases/download/v1.1.11/swift_buildpack-cached-v1.1.11.zip
cf update-buildpack swift_buildpack -p swift_buildpack-cached-v1.1.11.zip
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
