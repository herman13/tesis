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
#Scenario.endTime = 344k
#Scenario.endTime = 172k
#Scenario.endTime = 100k
#Scenario.endTime = 80k
#Scenario.endTime = 50k
#Scenario.endTime = 20k
#Scenario.endTime = 10k
#Scenario.endTime = 4500
#Scenario.endTime = 5k
#Scenario.endTime = 3300
#Scenario.endTime = 3k
Scenario.endTime = {{ tiempo }}

Scenario.networkSeed = {{ networkSeed }}
MovementModel.rngSeed = {{ seed }}
MapBasedMovement.valpo = {{ valpo }}

MetricProtocol.maximoNormalizar = 400
MetricProtocol.ventanaHistoria = 25000
MetricProtocol.tamanoVentanaContextos = 10000
MetricProtocol.alpha = 0.2
Group.tiempoCambioRouter = 5000
Optimization.parallel = false

Scenario.nrofHostGroups = 23

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

MovementModel.worldSize = 16000, 16000

# Rango de transmision es de 50 metros
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
Group.metrica = TiemposMetrica
Group.MetaRouterCambiarRouters = {{ cambiar_router }}


# Solo un centro principal
# ID = 1
Group1.groupID = maincenter_
Group1.nrofHosts = 1
Group1.movementModel = valpo.CenterMovement
Group1.centerType = mainreliefcenter
Group1.speed = 0.0, 0.0




# Son 10 vecindarios
# 11
Group2.groupID = neighborhood_
Group2.nrofHosts = 10
Group2.movementModel = valpo.CenterMovement
Group2.centerType = neighborhood
Group2.minDistanceFromOthers = 500m
Group2.neighborhoodRadius = 100m
Group2.speed = 0.0, 0.0
Group2.waitTime = 0.0, 0.0
# Los vecindarios no tienen router
Group2.bufferSize = 0
Group2.transmitRange = 0





######## CENTROSSSSSSS
# 73
Group3.groupID = CENTRO_COORDINACION_
Group3.nrofHosts = 1
Group3.movementModel = valpo.CenterMovement
Group3.centerType = coord
#Group3.transmitRange = 0


# 83
Group4.groupID = RELIEF_SUPPLY_CENTER_
Group4.nrofHosts = 10
Group4.movementModel = valpo.CenterMovement
Group4.centerType = reliefcenter_SUPLY
#Group4.transmitRange = 0

# 84
Group5.groupID = POLICE_CENTER_
Group5.nrofHosts = 1
Group5.movementModel = valpo.CenterMovement
Group5.centerType = police


# 89
Group6.groupID = EVACUATION_CENTER_
Group6.nrofHosts = 10
Group6.movementModel = valpo.CenterMovement
Group6.centerType = evacuationcenter


# 90
Group7.groupID = MEDICAL_CENTER_
Group7.nrofHosts = 1
Group7.movementModel = valpo.CenterMovement
Group7.centerType = medical


# 95
Group8.groupID = COORD_SUPPLY_VEHICLE_
Group8.nrofHosts = 5
Group8.movementModel = valpo.CenterToCenter
Group8.centerType = coord_supply
Group8.speed = 12.5, 15.27


# 100
Group9.groupID = RELIF_CENTER_VEHICLE_
Group9.nrofHosts = 1
Group9.movementModel = valpo.CenterMovement
Group9.centerType = relif_center
Group9.speed = 12.5, 15.27



################ FIN CENTROS




############## Vehiculos

# 102
Group10.groupID = AMBULANCE_CARRIER
Group10.nrofHosts = {{ ambulancias }}
Group10.movementModel = valpo.AmbulanceMovement
Group10.homeCenterType = medical
Group10.targetCenters = neighborhood, medical
Group10.speed = 12.5, 15.27
Group10.waitTime = 1200, 3600
Group10.bufferSize = 1000M


# 103
Group11.groupID = ROAD_REPAIR_VEHICLE_CARRIER
Group11.nrofHosts = {{ road_repair }}
Group11.movementModel = valpo.InCenterVehicleMovement
Group11.homeCenterType = reliefcenter_SUPLY
Group11.targetCenters = neighborhood, reliefcenter_SUPLY
Group11.speed = 12.5, 15.27
Group11.waitTime = 1200, 3600
Group11.bufferSize = 1000M


# 104
Group12.groupID = POLICE_VEHICLE_CARRIER
Group12.nrofHosts = {{ police }}
Group12.movementModel = valpo.PoliceMovement
Group12.homeCenterType = police
Group12.targetCenters = neighborhood
Group12.speed = 12.5, 15.27
Group12.waitTime = 1200, 3600
Group12.bufferSize = 1000M



############### LOS RESCATISTAS

# 124
Group13.groupID = RESCUE_WORKER_CARRIER
Group13.nrofHosts = {{ rescatistas }}
Group13.movementModel = valpo.RescueWorkerMovement
Group13.homeCenterType = reliefcenter_SUPLY
Group13.targetCenters = neighborhood, house
Group13.speed = 1.111, 1.389
Group13.waitTime = 5, 10


######## AHORA LAS PERSONAS NORMALES, estos son voluntarios que se mueven por el
# vecindario para ayudar a los rescatistas

# 144
Group14.groupID = PERSONA_0_
Group14.nrofHosts = {{ personas }}
Group14.movementModel = valpo.HumanValpoMovement
Group14.neighborhood = 0
Group14.radius = 500
Group14.speed = 1.111, 2.4
Group14.waitTime = 5, 10
Group14.homeCenter = {{ homeCenter }}
Group14.stayProb = {{ stayProb }}

#164
Group15.groupID = PERSONA_1_
Group15.nrofHosts = {{ personas }}
Group15.movementModel = valpo.HumanValpoMovement
Group15.neighborhood = 1
Group15.radius = 500
Group15.speed = 1.111, 2.4
Group15.waitTime = 5, 10
Group15.homeCenter = {{ homeCenter }}
Group15.stayProb = {{ stayProb }}

#184
Group16.groupID = PERSONA_2_
Group16.nrofHosts = {{ personas }}
Group16.movementModel = valpo.HumanValpoMovement
Group16.neighborhood = 2
Group16.radius = 500
Group16.speed = 1.111, 2.4
Group16.waitTime = 5, 10
Group16.homeCenter = {{ homeCenter }}
Group16.stayProb = {{ stayProb }}

#204
Group17.groupID = PERSONA_3_
Group17.nrofHosts = {{ personas }}
Group17.movementModel = valpo.HumanValpoMovement
Group17.neighborhood = 3
Group17.radius = 500
Group17.speed = 1.111, 2.4
Group17.waitTime = 5, 10
Group17.homeCenter = {{ homeCenter }}
Group17.stayProb = {{ stayProb }}

#224
Group18.groupID = PERSONA_4_
Group18.nrofHosts = {{ personas }}
Group18.movementModel = valpo.HumanValpoMovement
Group18.neighborhood = 4
Group18.radius = 500
Group18.speed = 1.111, 2.4
Group18.waitTime = 5, 10
Group18.homeCenter = {{ homeCenter }}
Group18.stayProb = {{ stayProb }}

#244
Group19.groupID = PERSONA_5_
Group19.nrofHosts = {{ personas }}
Group19.movementModel = valpo.HumanValpoMovement
Group19.neighborhood = 5
Group19.radius = 500
Group19.speed = 1.111, 2.4
Group19.waitTime = 5, 10
Group19.homeCenter = {{ homeCenter }}
Group19.stayProb = {{ stayProb }}

#264
Group20.groupID = PERSONA_6_
Group19.nrofHosts = {{ personas }}
Group20.movementModel = valpo.HumanValpoMovement
Group20.neighborhood = 6
Group20.radius = 500
Group20.speed = 1.111, 2.4
Group20.waitTime = 5, 10
Group20.homeCenter = {{ homeCenter }}
Group20.stayProb = {{ stayProb }}

#284
Group21.groupID = PERSONA_7_
Group21.nrofHosts = {{ personas }}
Group21.movementModel = valpo.HumanValpoMovement
Group21.neighborhood = 7
Group21.radius = 500
Group21.speed = 1.111, 2.4
Group21.waitTime = 5, 10
Group21.homeCenter = {{ homeCenter }}
Group21.stayProb = {{ stayProb }}

#304
Group22.groupID = PERSONA_8_
Group22.nrofHosts = {{ personas }}
Group22.movementModel = valpo.HumanValpoMovement
Group22.neighborhood = 8
Group22.radius = 500
Group22.speed = 1.111, 2.4
Group22.waitTime = 5, 10
Group22.homeCenter = {{ homeCenter }}
Group22.stayProb = {{ stayProb }}

#324
Group23.groupID = PERSONA_9_
Group23.nrofHosts = {{ personas }}
Group23.movementModel = valpo.HumanValpoMovement
Group23.neighborhood = 9
Group23.radius = 500
Group23.speed = 1.111, 2.4
Group23.waitTime = 5, 10
Group23.homeCenter = {{ homeCenter }}
Group23.stayProb = {{ stayProb }}





## Message creation parameters 
# How many event generators
Events.nrof = 1
# Class of the first event generator
Events1.class = MessageEventGenerator
#Events1.class = MessageEventGeneratorPersonasCentros
#Events1.class = {{ eventClass }}


# (following settings are specific for the MessageEventGenerator class)
# 5 min => 300s
Events1.interval = {{mensajes_tiempo}} , {{mensajes_tiempo}}
# Message sizes (500kB - 1MB)
#Events1.size = 500k
Events1.size = {{tamanoMensaje}}k
# range of message source/destination addresses
# Los mensajes son de centro a centro
#Events1.hosts = 0, 99
#Events1.hosts = 0, 270
Events1.hosts = 0, {{ nodosTotales }}
#Events1.hosts = {{ eventHosts }}
#Events1.otrosId = {{ otrosId }}
# Message ID prefix
Events1.prefix = M
Events1.eventSeed = {{ eventSeed }}

Report.nrofReports = {{ numero_reportes }}
#Report.nrofReports = 5
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
