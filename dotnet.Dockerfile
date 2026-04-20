RUN yay -S --noconfirm dotnet-runtime dotnet-sdk \
  aspnet-runtime aspnet-targeting-pack
RUN yay -S --noconfirm dotnet-runtime-9.0 dotnet-sdk-9.0 \
  aspnet-runtime-9.0 aspnet-targeting-pack-9.0
RUN yay -S --noconfirm dotnet-runtime-8.0 dotnet-sdk-8.0 \
  aspnet-runtime-8.0 aspnet-targeting-pack-8.0

ENV DOTNET_CLI_TELEMETRY_OPTOUT="1"
ENV DOTNET_UPGRADEASSISTANT_TELEMETRY_OPTOUT="1"

COPY --chmod=666 ./dotnet.env.sh /env.sh
