FROM microsoft/dotnet-framework:4.7.1-windowsservercore-1709

WORKDIR /app

# Install dll files needed by OpenCvSharp
ADD system32_opencvsharp_deps.zip .
RUN powershell Expand-Archive system32_opencvsharp_deps.zip C:/Windows/System32
RUN powershell Remove-Item system32_opencvsharp_deps.zip

# Add binary to image
ADD ./bin/Debug/net471 .

CMD ["Example.exe"]
