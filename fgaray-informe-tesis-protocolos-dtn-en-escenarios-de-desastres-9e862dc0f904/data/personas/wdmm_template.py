
template = """
#
# Default settings for the simulation
#

## Scenario settings
Scenario.name = pdm_scenario_prueba
Scenario.simulateConnections = true
Scenario.updateInterval = 1
# 43k ~= 12h

# Son 96 horas => 344k
#Scenario.endTime = 172k
# Scenario.endTime = 345600 
# Scenario.endTime = 100k
# Scenario.endTime = 80k
# Scenario.endTime = 50k
# Scenario.endTime = 25k
# Scenario.endTime = 15k
Scenario.endTime = {{ tiempo }}


MovementModel.rngSeed = {{ seed }}
Scenario.networkSeed = {{ networkSeed }}
MapBasedMovement.valpo = {{ valpo }}

MetricProtocol.maximoNormalizar = 400
MetricProtocol.ventanaHistoria = 5000
MetricProtocol.tamanoVentanaContextos = 15000
Group.tiempoCambioRouter = 5000
#MetricProtocol.alpha = 0.8
MetricProtocol.alpha = 0.2
Optimization.parallel = false

Scenario.nrofHostGroups = 2

## Group-specific settings:
# groupID : Group's identifier. Used as the prefix of host names
# nrofHosts: number of hosts in the group
# transmitRange: range of the hosts' radio devices (meters)
# transmitSpeed: transmit speed of the radio devices (bytes per second)
# movementModel: movement model of the hosts (valid class name from movement package)
# waitTime: minimum and maximum wait times (seconds) after reaching destination
# speed: minimum and maximum speeds (m/s) when moving on a path
# bufferSize: size of the message buffer (bytes)
# router: router used to route messages (valid class name from routing package)
# activeTimes: Time intervals when the nodes in the group are active (start1, end1, start2, end2, ...)
# msgTtl : TTL (minutes) of the messages created by this host group, default=infinite

## Group and movement model specific settings
# pois: Points Of Interest indexes and probabilities (poiIndex1, poiProb1, poiIndex2, poiProb2, ... ) - for ShortestPathMapBasedMovement
# okMaps : which map nodes are OK for the group (map file indexes), default=all - for all MapBasedMovent models
# routeFile: route's file path - for MapRouteMovement
# routeType: route's type - for MapRouteMovement


# Rango de es de 50 metros
# Bluetooth 4 con 25 Mbps
Group.transmitRange = 100
btInterface.transmitSpeed = 1000k
Group.waitTime = 5, 10
Group.router = {{ router }}
Group.bufferSize = {{buffer}}M
#Group.bufferSize = {{variable}}M
# 6 Horas => 360 min
Group.msgTtl = 360
Group.nrofCopies = {{ copias }}
Group.metaRouterKeepPreviousProperty = {{keep}}
Group.metaRouterCarrier = {{ router_carrier }}
Group.metaRouterCluster = {{ router_cluster }}
Group.FawkesBeta = {{beta}}
Group.Tailgaing = {{tailgating}}
Group.atraidosSoloBuenos = false
Group.horasEliminacion = {{horasEliminacion}}
Group.greyhole = false
Group.prob_drop = 100
Group.MetaRouterCambiarRouters = {{ cambiar_router }}


## Revisar
Group.busControlSystemNr = 1
Group.workDayLength = 28800
Group.nrOfOffices = 30
Group.officeSize = 100
Group.officeWaitTimeParetoCoeff = 0.5
Group.officeMinWaitTime = 10
Group.officeMaxWaitTime = 1000
Group.timeDiffSTD = 7200
Group.nrOfMeetingSpots = 4
## Revisar
Group.minGroupSize = 1
## Revisar
Group.maxGroupSize = 3
## Revisar
Group.shoppingControlSystemNr = 1
## Revisar
Group.maxAfterShoppingStopTime = 1000
## Revisar
Group.minAfterShoppingStopTime = 100

Group.ownCarProb = 0.5

Group.probGoShoppingAfterWork = 0.3

# Buses A
Group1.groupID = BUS_A_
# Group1.nrofHosts = 2
Group1.nrofHosts = 5
Group1.speed = 7, 10
Group1.waitTime = 10, 30
Group1.movementModel = BusMovement
Group1.routeFile = data/HelsinkiMedium/A_bus.wkt
Group1.routeType = 2
Group1.busControlSystemNr = 1
Group1.bufferSize = 1000M


# Personas en A
Group2.groupID = PERSONA_A_
Group2.waitTime = 0, 0
Group2.nrofHosts = {{ personasWDMM }}
Group2.movementModel = WorkingDayMovement
Group2.busControlSystemNr = 1
Group2.speed = 0.8, 1.4
Group2.ownCarProb = 0.5
Group2.shoppingControlSystemNr = 1
Group2.meetingSpotsFile = data/HelsinkiMedium/A_meetingspots.wkt
Group2.officeLocationsFile = data/HelsinkiMedium/A_offices.wkt
Group2.homeLocationsFile = data/HelsinkiMedium/A_homes.wkt



## Message creation parameters 
# How many event generators
Events.nrof = 1
# Class of the first event generator
Events1.class = MessageEventGenerator


# (following settings are specific for the MessageEventGenerator class)
# 5 min => 300s
Events1.interval = {{mensajes_tiempo}} , {{mensajes_tiempo}}
# Message sizes (500kB - 1MB)
#Events1.size = 25k
Events1.size = {{ tamanoMensaje }}k
# range of message source/destination addresses
# Los mensajes son de centro a centro
#Events1.hosts = 0, 152
Events1.hosts = 0, {{ nodosTotalesWDMM }}
# Message ID prefix
Events1.prefix = M
Events1.eventSeed = {{ eventSeed }}



Report.nrofReports = {{ numero_reportes }}
# Report.nrofReports = 5
# Report.nrofReports = 14
# length of the warm up period (simulated seconds)
Report.warmup = 0
# Report.warmup = 20k
# default directory of reports (can be overridden per Report with output setting)
Report.reportDir = {{report_folder}}/
# Report classes to load
Report.report1 = MessageStatsReport
# Report.report2 = FEnergia
# Report.report3 = MessageStatsReportTiempo
# Report.report4 = LatenciaGrafico
# Report.report5 = EncuentrosMetrica
# Report.report6 = TiemposGrafico
# Report.report7 = CopiasMensajesGrafico
# Report.report8 = DeliveryEstimado
# Report.report9 = RouterTiempo
# Report.report10 = EncuentrosPorNodo
# Report.report11 = TiemposMetrica
# Report.report12 = EncuentrosUnico
# Report.report13 = TiemposUnico


Report.report2 = FEnergia

Report.report3 = ValoresDelivery
Report.report4 = ValoresOverhead
Report.report5 = PromedioNotasTiempo
Report.report6 = RouterTiempoPorNodo
Report.report7 = BufferFree


# Report.report4 = NotasTiempo
# Report.report3 = Valores
"""
