IBM Bluemix buildpack for Swift
===============================

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

Creating route kitura-starter-bluemix-heterographic-kamelaukion.stage1.mybluemix.net...
OK

Binding kitura-starter-bluemix-heterographic-kamelaukion.stage1.mybluemix.net to Kitura-Starter-Bluemix...
OK

Uploading Kitura-Starter-Bluemix...
Uploading app files from: /Users/olivieri/git/Kitura-Starter-Bluemix
Uploading 24.2K, 14 files
Done uploading               
OK

Starting app Kitura-Starter-Bluemix in org roliv@us.ibm.com / space dev as roliv@us.ibm.com...
-----> Downloaded app package (12K)
-----> Default supported Swift version is 3.0
-----> Installing system level dependencies...
-----> Installing libblocksruntime0_0.1-1_amd64.deb
-----> Installing libblocksruntime-dev_0.1-1_amd64.deb
-----> Installing libcurl3_7.35.0-1ubuntu2.6_amd64.deb
-----> Installing libkqueue0_1.0.4-2ubuntu1_amd64.deb
-----> Installing libssl-dev_1.0.1f-1ubuntu2.19_amd64.deb
-----> Installing openssl_1.0.1f-1ubuntu2.19_amd64.deb
-----> Installing uuid-dev_2.20.1-5.1ubuntu20_amd64.deb
-----> No Aptfile found.
-----> Writing profile script...
-----> Buildpack version 2.0.0
-----> Installing Swift 3.0
       Downloaded Swift
-----> Installing Clang 3.8.0
       Downloaded Clang
-----> This buildpack does not add libdispatch binaries for swift-3.0 (note: Swift binaries from 8/23 and later already include libdispatch)
-----> Building Package...
       Cloning https://github.com/IBM-Swift/Kitura.git
       HEAD is now at 1bff857 Update Package.swift
       Resolved version: 0.32.0
       Cloning https://github.com/IBM-Swift/Kitura-net.git
       HEAD is now at 3bab86e updated dependency versions in Package.swift
       Resolved version: 0.32.0
       Cloning https://github.com/IBM-Swift/LoggerAPI.git
       HEAD is now at 3454b0d 3.0
       Resolved version: 0.12.0
       Cloning https://github.com/IBM-Swift/BlueSocket.git
       HEAD is now at c1a68c4 Update to latest (9/12) toolchain.
       Resolved version: 0.10.15
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
       HEAD is now at 73b523a 3.0
       Resolved version: 14.2.0
       Cloning https://github.com/IBM-Swift/Kitura-TemplateEngine.git
       HEAD is now at 49796c6 3.0
       Resolved version: 0.32.0
       Cloning https://github.com/IBM-Swift/HeliumLogger.git
       HEAD is now at 7e9b5eb updated dependency versions in Package.swift
       Resolved version: 0.17.0
       Cloning https://github.com/IBM-Swift/Swift-cfenv.git
       HEAD is now at 04d7d88 Update swift version to 3.0
       Resolved version: 1.7.0
       Cloning https://github.com/IBM-Bluemix/cf-deployment-tracker-client-swift.git
       HEAD is now at 3639d97 Update swift supported versions in README.
       Resolved version: 0.3.0
       Compile CHTTPParser utils.c
       Compile CHTTPParser http_parser.c
       Compile Swift Module 'Socket' (3 sources)
       Compile Swift Module 'LoggerAPI' (1 sources)
       Compile Swift Module 'SwiftyJSON' (2 sources)
       Compile Swift Module 'KituraTemplateEngine' (1 sources)
       Compile Swift Module 'HeliumLogger' (1 sources)
       Linking CHTTPParser
       Compile Swift Module 'KituraNet' (29 sources)
       Compile Swift Module 'CloudFoundryEnv' (7 sources)
       Compile Swift Module 'CloudFoundryDeploymentTracker' (1 sources)
       Compile Swift Module 'Kitura' (38 sources)
       Compile Swift Module 'Kitura_Starter_Bluemix' (1 sources)
       Linking ./.build/release/Kitura-Starter-Bluemix
-----> Copying dynamic libraries
-----> Cleaning up build files
-----> Cleaning up cache folder

-----> Uploading droplet (16M)

1 of 1 instances running

App started


OK

App Kitura-Starter-Bluemix was started using this command `Kitura-Starter-Bluemix`

Showing health and status for app Kitura-Starter-Bluemix in org roliv@us.ibm.com / space dev as roliv@us.ibm.com...
OK

requested state: started
instances: 1/1
usage: 256M x 1 instances
urls: kitura-starter-bluemix-heterographic-kamelaukion.stage1.mybluemix.net
last uploaded: Mon Sep 19 20:00:46 UTC 2016
stack: cflinuxfs2
buildpack: swift_buildpack

     state     since                    cpu    memory          disk          details
#0   running   2016-09-19 03:02:48 PM   0.0%   18.8M of 256M   54.9M of 1G    
```

The buildpack will detect your app as Swift if it has a `Package.swift` file in the root.

### Version installed on Bluemix

The latest version of the IBM Bluemix buildpack for Swift on Bluemix is [v2.0.0](https://github.com/IBM-Swift/swift-buildpack/releases/tag/2.0.0).

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

The latest version of Swift supported by this buildpack is ```3.0```.

### Specify a Swift version

You specify the version of Swift for your application using a `.swift-version` file in the root of your repository:

```shell
$ cat .swift-version
3.0
```

Please note that the swift_buildpack installed on Bluemix **caches** the following versions of the Swift binaries:

- `3.0`

If you'd like to use a different version of Swift [that is not cached] on Bluemix, you can specify it in the `.swift-version` file.  Please be aware that using a Swift version that is not cached increases the provisioning time of your app on Bluemix.

The [manifest.yml](https://github.com/IBM-Swift/swift-buildpack/blob/develop/manifest.yml) file contains the complete list of the Swift versions that are cached on Bluemix.

Since there are frequent Swift language changes, it's advised that you pin your application to a specific Swift version. Once you have tested and migrated your code to a newer version of Swift, you can then update the `.swift-version` file with the appropriate Swift version.

### System level libraries

This buildpack installs the following system libraries:

- libcurl3
- openssl
- libssl-dev
- uuid-dev

### libdispatch

Previous versions of this buildpack provided the [libdispatch](https://github.com/apple/swift-corelibs-libdispatch) binaries for Swift development builds **prior** to 2016-08-23. However, current and future versions of this buildpack will **not** provide those binaries. Users should upgrade their applications to Swift 3.0, which already includes the libdispatch binaries.

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
wget https://github.com/IBM-Swift/swift-buildpack/releases/download/v2.0.0/buildpack_swift_v2.0.0-20160915-1220.zip
cf create-buildpack swift_buildpack buildpack_swift_v2.0.0-20160915-1220.zip <position>
```

And to update it:

```
wget https://github.com/IBM-Swift/swift-buildpack/releases/download/v2.0.0/buildpack_swift_v2.0.0-20160915-1220.zip
cf update-buildpack swift_buildpack -p buildpack_swift_v2.0.0-20160915-1220.zip
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
