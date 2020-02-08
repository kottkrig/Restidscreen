defmodule Restid.Api.InMemory do
  alias Restid.Request.Location

  def get_trips(%Location{} = _origin, %Location{} = _destination) do
    {:ok,
     %{
       "TripList" => %{
         "Trip" => [
           %{
             "Leg" => [
               %{
                 "Destination" => %{
                   "$" => "\n",
                   "date" => "2020-02-08",
                   "id" => "9022014003610001",
                   "name" => "Jaegerdorffsplatsen, Göteborg",
                   "time" => "12:24",
                   "track" => "A",
                   "type" => "ST"
                 },
                 "Origin" => %{
                   "$" => "\n",
                   "date" => "2020-02-08",
                   "name" => "Seglaregatan",
                   "time" => "12:18",
                   "type" => "ADR"
                 },
                 "name" => "Gå",
                 "type" => "WALK"
               },
               %{
                 "Destination" => %{
                   "$" => "\n",
                   "date" => "2020-02-08",
                   "id" => "9022014001950001",
                   "name" => "Centralstationen, Göteborg",
                   "routeIdx" => "13",
                   "rtDate" => "2020-02-08",
                   "rtTime" => "12:41",
                   "time" => "12:39",
                   "track" => "A",
                   "type" => "ST"
                 },
                 "JourneyDetailRef" => %{
                   "ref" =>
                     "https://api.vasttrafik.se/bin/rest.exe/v2/journeyDetail?ref=991194%2F333453%2F334018%2F163395%2F80%3Fdate%3D2020-02-08%26station_evaId%3D3610001%26station_type%3Ddep%26format%3Djson%26"
                 },
                 "Origin" => %{
                   "$" => "\n",
                   "date" => "2020-02-08",
                   "id" => "9022014003610001",
                   "name" => "Jaegerdorffsplatsen, Göteborg",
                   "routeIdx" => "5",
                   "rtDate" => "2020-02-08",
                   "rtTime" => "12:26",
                   "time" => "12:24",
                   "track" => "A",
                   "type" => "ST"
                 },
                 "accessibility" => "wheelChair",
                 "bgColor" => "#006C93",
                 "direction" => "Angered",
                 "fgColor" => "#D0EDFB",
                 "id" => "9015014500900049",
                 "journeyNumber" => "49",
                 "name" => "Spårvagn 9",
                 "sname" => "9",
                 "stroke" => "Solid",
                 "type" => "TRAM"
               },
               %{
                 "Destination" => %{
                   "$" => "\n",
                   "date" => "2020-02-08",
                   "name" => "Centralstationen",
                   "time" => "12:41",
                   "type" => "ADR"
                 },
                 "Origin" => %{
                   "$" => "\n",
                   "date" => "2020-02-08",
                   "id" => "9022014001950001",
                   "name" => "Centralstationen, Göteborg",
                   "time" => "12:39",
                   "track" => "A",
                   "type" => "ST"
                 },
                 "name" => "Gå",
                 "type" => "WALK"
               }
             ]
           },
           %{
             "Leg" => [
               %{
                 "Destination" => %{
                   "$" => "\n",
                   "date" => "2020-02-08",
                   "id" => "9022014003610001",
                   "name" => "Jaegerdorffsplatsen, Göteborg",
                   "time" => "12:34",
                   "track" => "A",
                   "type" => "ST"
                 },
                 "Origin" => %{
                   "$" => "\n",
                   "date" => "2020-02-08",
                   "name" => "Seglaregatan",
                   "time" => "12:28",
                   "type" => "ADR"
                 },
                 "name" => "Gå",
                 "type" => "WALK"
               },
               %{
                 "Destination" => %{
                   "$" => "\n",
                   "date" => "2020-02-08",
                   "id" => "9022014001950001",
                   "name" => "Centralstationen, Göteborg",
                   "routeIdx" => "13",
                   "rtDate" => "2020-02-08",
                   "rtTime" => "12:49",
                   "time" => "12:49",
                   "track" => "A",
                   "type" => "ST"
                 },
                 "JourneyDetailRef" => %{
                   "ref" =>
                     "https://api.vasttrafik.se/bin/rest.exe/v2/journeyDetail?ref=538743%2F182636%2F523100%2F81976%2F80%3Fdate%3D2020-02-08%26station_evaId%3D3610001%26station_type%3Ddep%26format%3Djson%26"
                 },
                 "Origin" => %{
                   "$" => "\n",
                   "date" => "2020-02-08",
                   "id" => "9022014003610001",
                   "name" => "Jaegerdorffsplatsen, Göteborg",
                   "routeIdx" => "5",
                   "rtDate" => "2020-02-08",
                   "rtTime" => "12:34",
                   "time" => "12:34",
                   "track" => "A",
                   "type" => "ST"
                 },
                 "accessibility" => "wheelChair",
                 "bgColor" => "#006C93",
                 "direction" => "Angered",
                 "fgColor" => "#D0EDFB",
                 "id" => "9015014500900051",
                 "journeyNumber" => "51",
                 "name" => "Spårvagn 9",
                 "sname" => "9",
                 "stroke" => "Solid",
                 "type" => "TRAM"
               },
               %{
                 "Destination" => %{
                   "$" => "\n",
                   "date" => "2020-02-08",
                   "name" => "Centralstationen",
                   "time" => "12:51",
                   "type" => "ADR"
                 },
                 "Origin" => %{
                   "$" => "\n",
                   "date" => "2020-02-08",
                   "id" => "9022014001950001",
                   "name" => "Centralstationen, Göteborg",
                   "time" => "12:49",
                   "track" => "A",
                   "type" => "ST"
                 },
                 "name" => "Gå",
                 "type" => "WALK"
               }
             ]
           },
           %{
             "Leg" => [
               %{
                 "Destination" => %{
                   "$" => "\n",
                   "date" => "2020-02-08",
                   "id" => "9022014004730001",
                   "name" => "Mariaplan, Göteborg",
                   "time" => "12:37",
                   "track" => "A",
                   "type" => "ST"
                 },
                 "Origin" => %{
                   "$" => "\n",
                   "date" => "2020-02-08",
                   "name" => "Seglaregatan",
                   "time" => "12:29",
                   "type" => "ADR"
                 },
                 "name" => "Gå",
                 "type" => "WALK"
               },
               %{
                 "Destination" => %{
                   "$" => "\n",
                   "date" => "2020-02-08",
                   "id" => "9022014001950001",
                   "name" => "Centralstationen, Göteborg",
                   "routeIdx" => "23",
                   "rtDate" => "2020-02-08",
                   "rtTime" => "12:58",
                   "time" => "12:59",
                   "track" => "A",
                   "type" => "ST"
                 },
                 "JourneyDetailRef" => %{
                   "ref" =>
                     "https://api.vasttrafik.se/bin/rest.exe/v2/journeyDetail?ref=636777%2F215380%2F152166%2F136184%2F80%3Fdate%3D2020-02-08%26station_evaId%3D4730001%26station_type%3Ddep%26format%3Djson%26"
                 },
                 "Origin" => %{
                   "$" => "\n",
                   "date" => "2020-02-08",
                   "id" => "9022014004730001",
                   "name" => "Mariaplan, Göteborg",
                   "routeIdx" => "11",
                   "rtDate" => "2020-02-08",
                   "rtTime" => "12:37",
                   "time" => "12:38",
                   "track" => "A",
                   "type" => "ST"
                 },
                 "accessibility" => "wheelChair",
                 "bgColor" => "#FFFFFF",
                 "direction" => "Bergsjön",
                 "fgColor" => "#000000",
                 "id" => "9015014501100069",
                 "journeyNumber" => "69",
                 "name" => "Spårvagn 11",
                 "sname" => "11",
                 "stroke" => "Solid",
                 "type" => "TRAM"
               },
               %{
                 "Destination" => %{
                   "$" => "\n",
                   "date" => "2020-02-08",
                   "name" => "Centralstationen",
                   "time" => "13:00",
                   "type" => "ADR"
                 },
                 "Origin" => %{
                   "$" => "\n",
                   "date" => "2020-02-08",
                   "id" => "9022014001950001",
                   "name" => "Centralstationen, Göteborg",
                   "time" => "12:58",
                   "track" => "A",
                   "type" => "ST"
                 },
                 "name" => "Gå",
                 "type" => "WALK"
               }
             ],
             "alternative" => "true"
           },
           %{
             "Leg" => [
               %{
                 "Destination" => %{
                   "$" => "\n",
                   "date" => "2020-02-08",
                   "id" => "9022014003610001",
                   "name" => "Jaegerdorffsplatsen, Göteborg",
                   "time" => "12:44",
                   "track" => "A",
                   "type" => "ST"
                 },
                 "Origin" => %{
                   "$" => "\n",
                   "date" => "2020-02-08",
                   "name" => "Seglaregatan",
                   "time" => "12:38",
                   "type" => "ADR"
                 },
                 "name" => "Gå",
                 "type" => "WALK"
               },
               %{
                 "Destination" => %{
                   "$" => "\n",
                   "date" => "2020-02-08",
                   "id" => "9022014001950001",
                   "name" => "Centralstationen, Göteborg",
                   "routeIdx" => "13",
                   "rtDate" => "2020-02-08",
                   "rtTime" => "12:59",
                   "time" => "12:59",
                   "track" => "A",
                   "type" => "ST"
                 },
                 "JourneyDetailRef" => %{
                   "ref" =>
                     "https://api.vasttrafik.se/bin/rest.exe/v2/journeyDetail?ref=825816%2F278327%2F629634%2F39553%2F80%3Fdate%3D2020-02-08%26station_evaId%3D3610001%26station_type%3Ddep%26format%3Djson%26"
                 },
                 "Origin" => %{
                   "$" => "\n",
                   "date" => "2020-02-08",
                   "id" => "9022014003610001",
                   "name" => "Jaegerdorffsplatsen, Göteborg",
                   "routeIdx" => "5",
                   "rtDate" => "2020-02-08",
                   "rtTime" => "12:44",
                   "time" => "12:44",
                   "track" => "A",
                   "type" => "ST"
                 },
                 "accessibility" => "wheelChair",
                 "bgColor" => "#006C93",
                 "direction" => "Angered",
                 "fgColor" => "#D0EDFB",
                 "id" => "9015014500900053",
                 "journeyNumber" => "53",
                 "name" => "Spårvagn 9",
                 "sname" => "9",
                 "stroke" => "Solid",
                 "type" => "TRAM"
               },
               %{
                 "Destination" => %{
                   "$" => "\n",
                   "date" => "2020-02-08",
                   "name" => "Centralstationen",
                   "time" => "13:01",
                   "type" => "ADR"
                 },
                 "Origin" => %{
                   "$" => "\n",
                   "date" => "2020-02-08",
                   "id" => "9022014001950001",
                   "name" => "Centralstationen, Göteborg",
                   "time" => "12:59",
                   "track" => "A",
                   "type" => "ST"
                 },
                 "name" => "Gå",
                 "type" => "WALK"
               }
             ]
           },
           %{
             "Leg" => [
               %{
                 "Destination" => %{
                   "$" => "\n",
                   "date" => "2020-02-08",
                   "id" => "9022014003610001",
                   "name" => "Jaegerdorffsplatsen, Göteborg",
                   "time" => "12:54",
                   "track" => "A",
                   "type" => "ST"
                 },
                 "Origin" => %{
                   "$" => "\n",
                   "date" => "2020-02-08",
                   "name" => "Seglaregatan",
                   "time" => "12:48",
                   "type" => "ADR"
                 },
                 "name" => "Gå",
                 "type" => "WALK"
               },
               %{
                 "Destination" => %{
                   "$" => "\n",
                   "date" => "2020-02-08",
                   "id" => "9022014001950001",
                   "name" => "Centralstationen, Göteborg",
                   "routeIdx" => "13",
                   "rtDate" => "2020-02-08",
                   "rtTime" => "13:09",
                   "time" => "13:09",
                   "track" => "A",
                   "type" => "ST"
                 },
                 "JourneyDetailRef" => %{
                   "ref" =>
                     "https://api.vasttrafik.se/bin/rest.exe/v2/journeyDetail?ref=870276%2F293147%2F261926%2F159138%2F80%3Fdate%3D2020-02-08%26station_evaId%3D3610001%26station_type%3Ddep%26format%3Djson%26"
                 },
                 "Origin" => %{
                   "$" => "\n",
                   "date" => "2020-02-08",
                   "id" => "9022014003610001",
                   "name" => "Jaegerdorffsplatsen, Göteborg",
                   "routeIdx" => "5",
                   "rtDate" => "2020-02-08",
                   "rtTime" => "12:54",
                   "time" => "12:54",
                   "track" => "A",
                   "type" => "ST"
                 },
                 "accessibility" => "wheelChair",
                 "bgColor" => "#006C93",
                 "direction" => "Angered",
                 "fgColor" => "#D0EDFB",
                 "id" => "9015014500900055",
                 "journeyNumber" => "55",
                 "name" => "Spårvagn 9",
                 "sname" => "9",
                 "stroke" => "Solid",
                 "type" => "TRAM"
               },
               %{
                 "Destination" => %{
                   "$" => "\n",
                   "date" => "2020-02-08",
                   "name" => "Centralstationen",
                   "time" => "13:11",
                   "type" => "ADR"
                 },
                 "Origin" => %{
                   "$" => "\n",
                   "date" => "2020-02-08",
                   "id" => "9022014001950001",
                   "name" => "Centralstationen, Göteborg",
                   "time" => "13:09",
                   "track" => "A",
                   "type" => "ST"
                 },
                 "name" => "Gå",
                 "type" => "WALK"
               }
             ]
           },
           %{
             "Leg" => [
               %{
                 "Destination" => %{
                   "$" => "\n",
                   "date" => "2020-02-08",
                   "id" => "9022014003610001",
                   "name" => "Jaegerdorffsplatsen, Göteborg",
                   "time" => "13:04",
                   "track" => "A",
                   "type" => "ST"
                 },
                 "Origin" => %{
                   "$" => "\n",
                   "date" => "2020-02-08",
                   "name" => "Seglaregatan",
                   "time" => "12:58",
                   "type" => "ADR"
                 },
                 "name" => "Gå",
                 "type" => "WALK"
               },
               %{
                 "Destination" => %{
                   "$" => "\n",
                   "date" => "2020-02-08",
                   "id" => "9022014001950001",
                   "name" => "Centralstationen, Göteborg",
                   "routeIdx" => "13",
                   "rtDate" => "2020-02-08",
                   "rtTime" => "13:19",
                   "time" => "13:19",
                   "track" => "A",
                   "type" => "ST"
                 },
                 "JourneyDetailRef" => %{
                   "ref" =>
                     "https://api.vasttrafik.se/bin/rest.exe/v2/journeyDetail?ref=442416%2F150527%2F597264%2F151170%2F80%3Fdate%3D2020-02-08%26station_evaId%3D3610001%26station_type%3Ddep%26format%3Djson%26"
                 },
                 "Origin" => %{
                   "$" => "\n",
                   "date" => "2020-02-08",
                   "id" => "9022014003610001",
                   "name" => "Jaegerdorffsplatsen, Göteborg",
                   "routeIdx" => "5",
                   "rtDate" => "2020-02-08",
                   "rtTime" => "13:04",
                   "time" => "13:04",
                   "track" => "A",
                   "type" => "ST"
                 },
                 "accessibility" => "wheelChair",
                 "bgColor" => "#006C93",
                 "direction" => "Angered",
                 "fgColor" => "#D0EDFB",
                 "id" => "9015014500900057",
                 "journeyNumber" => "57",
                 "name" => "Spårvagn 9",
                 "sname" => "9",
                 "stroke" => "Solid",
                 "type" => "TRAM"
               },
               %{
                 "Destination" => %{
                   "$" => "\n",
                   "date" => "2020-02-08",
                   "name" => "Centralstationen",
                   "time" => "13:21",
                   "type" => "ADR"
                 },
                 "Origin" => %{
                   "$" => "\n",
                   "date" => "2020-02-08",
                   "id" => "9022014001950001",
                   "name" => "Centralstationen, Göteborg",
                   "time" => "13:19",
                   "track" => "A",
                   "type" => "ST"
                 },
                 "name" => "Gå",
                 "type" => "WALK"
               }
             ]
           }
         ],
         "noNamespaceSchemaLocation" => "http://api.vasttrafik.se/v1/hafasRestTrip.xsd",
         "serverdate" => "2020-02-08",
         "servertime" => "12:16"
       }
     }}
  end
end
