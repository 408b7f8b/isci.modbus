FROM debian:latest

# ARG isci.Ressource=Beispielressource
# ARG isci.Anwendung=Beispielsystem
# ARG isci.Modul=modbus

RUN apt-get update
RUN apt-get upgrade -y

RUN mkdir -p /mnt/datenstruktur
RUN mkdir -p /mnt/anwendungen

ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1

# ENV isci.Ressource='${isci.Ressource}'
# ENV isci.Anwendung='${isci.Anwendung}'
# ENV isci.Identifikation='${isci.Modul}'
# ENV isci.OrdnerAnwendungen='/mnt/anwendungen'
# ENV isci.OrdnerDatenstruktur='/mnt/datenstruktur/${isci.Anwendung}'
# ENV isci.OrdnerDatenmodelle='/mnt/anwendungen/${isci.Anwendung}/Datenmodelle'
# ENV isci.OrdnerEreignismodelle='/mnt/anwendungen/${isci.Anwendung}/Ereignismodelle'
# ENV isci.OrdnerFunktionsmodelle='/mnt/anwendungen/${isci.Anwendung}/Funktionsmodelle'
# ENV isci.OrdnerSchnittstellen='/mnt/anwendungen/${isci.Anwendung}/Schnittstellen'
# ENV isci.OrdnerBeschreibungen='/mnt/anwendungen/${isci.Anwendung}/Beschreibungen'
# ENV isci.Ausführungstransitionen='[{\"Eingangszustand\":0, \"Ausgangszustand\":1}]'

# ENV isci.Port='/dev/ttyRS485'
# ENV isci.Baudrate=115200
# ENV isci.Modbusfelder='[{"Adresse":300,"dateneintrag":{"Identifikation": "Beispielfeld","type":0,"istListe":false,"value":0}}]'

COPY bin/Debug/netcoreapp3.1/linux-x64/publish/isci.modbus /usr/local/bin

ENTRYPOINT ["/usr/local/bin/isci.modbus"]