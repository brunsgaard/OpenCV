## The problem

Our software was throwing the exception 
```
Unable to load DLL 'OpenCvSharpExtern': The specified module could not be found.
```
when executed in Windows container.


## Running OpenCVSharp in a Windows container 

This is an example running OpenCVSharp in a Windows container with `microsoft/dotnet-framework:4.7.1-windowsservercore-1709` as base image.


#### Missing dll's

You have to create a zip file with the [dll deps used by
OpenCVSharp](https://withinrafael.com/2017/09/09/windows-container-app-compat-opencv-python/).
You can copy the files from your Windows installation.

The content of my archive is listed below.
```
~/c/s/OpenCVSharp-docker-example on master ⨯ unzip -l system32_opencvsharp_deps.zip
Archive:  system32_opencvsharp_deps.zip
  Length      Date    Time    Name
---------  ---------- -----   ----
    79360  09-29-2017 14:41   avicap32.dll
   113664  09-29-2017 14:41   avifil32.dll
   106472  09-29-2017 14:41   msacm32.dll
   142848  09-29-2017 14:41   msvfw32.dll
---------                     -------
   442344                     4 files
```

#### Running the example

With the dll package (`system32_opencvsharp_deps.zip`) placed in the root of this repo, you should be able to build and run the project.

```
PS C:\Users\brunsgaard\OpenCVSharp-docker-example> dotnet build
Microsoft (R) Build Engine version 15.4.8.50001 for .NET Core
Copyright (C) Microsoft Corporation. All rights reserved.

  Example -> C:\Users\brunsgaard\OpenCVSharp-docker-example\bin\Debug\net471\Example.exe

Build succeeded.
    0 Warning(s)
    0 Error(s)

Time Elapsed 00:00:00.58

PS C:\Users\brunsgaard\OpenCVSharp-docker-example> dotnet run
Hello World!

PS C:\Users\brunsgaard\OpenCVSharp-docker-example> docker build -t opencvsharp-docker-example .
Sending build context to Docker daemon  118.5MB
Step 1/7 : FROM microsoft/dotnet-framework:4.7.1-windowsservercore-1709
 ---> 4385bc814c06
Step 2/7 : WORKDIR /app
 ---> Using cache
 ---> 4ab69524eae4
Step 3/7 : ADD system32_opencvsharp_deps.zip .
 ---> Using cache
 ---> 341f95c7c860
Step 4/7 : RUN powershell Expand-Archive system32_opencvsharp_deps.zip C:/Windows/System32
 ---> Using cache
 ---> 390332028d0a
Step 5/7 : RUN powershell Remove-Item system32_opencvsharp_deps.zip
 ---> Using cache
 ---> ccfa07f9f4ed
Step 6/7 : ADD ./bin/Debug/net471 .
 ---> Using cache
 ---> 576385bb7d91
Step 7/7 : CMD Example.exe
 ---> Using cache
 ---> 13bd4722c4fe
Successfully built 13bd4722c4fe
Successfully tagged opencvsharp-docker-example:latest

PS C:\Users\brunsgaard\OpenCVSharp-docker-example> docker run opencvsharp-docker-example
Hello World!
```

Hope someone out there find this usefull. :)
