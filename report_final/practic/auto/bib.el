(TeX-add-style-hook
 "bib"
 (lambda ()
   (LaTeX-add-bibitems
    "AutonomousVehicles"
    "VehicularNetworking"
    "ns3"
    "sumo"
    "ZIGBEE"))
 '(or :bibtex :latex))

