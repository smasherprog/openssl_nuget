<h2>Openssl automated build for nuget</h2>
<p>This is a script I wrote for automated building the build of openssl for windows</p>
<h3>Dependencies:</h3>
<ul>
<li>7Zip: Download and install the latest from here http://7-zip.org/download.html</li>
<li>ActivePerl: Download and install the latest from here http://www.activestate.com/activeperl/downloads</li>
<li>Openssl: Download the latest release <b>.tar.gz</b> from here https://www.openssl.org/source/</li>
</ul>
<p>After installing ActivePerl and 7zip, download the <b>.tar.gz</b> file and place it in the same location as the scripts.<p>
<p>Run build.bat . . . Building all libraries takes about 15 minutes.</p>
<p>This will build VS2013 VS2015 x86 x64 /MT and /MD library builds</p>
<p>This will build android armeabi x86 x86_64 Shared Library builds</p>
<p>This does not build with the following toolsets for android: armeabi-v7a; armeabi-v7a-hard; arm64-v8a;<br/>If anyone knows how to get openssl to build successfully under the following toolsets, please issue a Pull Request.</p>
<h3>Goal</h3>
<p>The goal with this package is to continue to support all vs platforms with the latest replease of openssl.</p>
