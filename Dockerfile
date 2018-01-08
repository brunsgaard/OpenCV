FROM microsoft/dotnet-framework:4.7.1-windowsservercore-1709

ADD bin/Release/net462/ /app
WORKDIR /app

ENTRYPOINT ["cmd.exe", "/k"]
