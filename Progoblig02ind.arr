include shared-gdrive(
"dcic-2021",
"1wyQZj_L0qqV9Ekgr9au6RX2iqt2Ga8Ep")
include gdrive-sheets
include data-source
ssid = "1RYN0i4Zx_UETVuYacgaGfnFcv4l9zd9toQTTdkQkj7g"
kWh-wealthy-consumer-data =
load-table: komponent, energi
source: load-spreadsheet(ssid).sheet-by-name("kWh", true)
    sanitize energi using string-sanitizer
end

### Definerte tallene for formelen til å regne ut energiforbruk av bilbruk, lagde formel for å regne dette ut som kan brukes senere i programmet ###

distance-traveled-pd = 30
distance-puf = 12
energy-puf = 10

energy-used-pd = (distance-traveled-pd / 
  distance-puf) * energy-puf

### Fullførte koden. "Endret | none => 0" til "| none => energy-used-pd" for å få energiforbruk til bil inn i tabellen. Dette kan føre til problemer dersom det dukker opp flere rader uten tall, men fungerer som en midlertidig løsning. ###

fun energi-to-number(str :: String) -> Number: 
  cases(Option) string-to-number(str):
    | some(a) => a
    | none => energy-used-pd
  end
  where:
  energi-to-number("48") is 48
  end

### Kode for å transformere kolonnene ###

tabell-tall = transform-column(kWh-wealthy-consumer-data, "energi", energi-to-number)


### Sum av tallene i tabellen ###

Energiforbruk = sum(tabell-tall, "energi")

### Chart ink. bil ###

bar-chart(tabell-tall, "komponent", "energi")
