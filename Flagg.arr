### Her har jeg lagt inn landkoder, bakgrunnsfarge og aksentfarger i en tabell. Dette gjorde det relativt lett å hente fargene til de rette landene ###

nordiskeflagg =
  table: landkode, bakgrunnsfarge, aksentfarger 
    row: "Nor", "crimson", "navy,white"
    row: "Den", "red", "white" 
    row: "Sve", "blue", "yellow" 
    row: "Isl", "navy", "crimson,white" 
    row: "Fae", "white", "crimson,navy" 
    row: "Fin", "white", "navy" 
  end

### En enkel funksjon som tegner flagg etter fargene i tabellen over. Forsøkte å integrere dimensjoner i tabellen for å få riktige lengder på flaggene, men det fikk jeg ikke til. ###

fun tegnflagg(landkode):
  if landkode == "Nor":
    block:
      bakgrunnsfarge = nordiskeflagg.row-n(0)["bakgrunnsfarge"]
      aksentfarger = string-split(nordiskeflagg.row-n(0)["aksentfarger"], ",")

        place-image(
        rotate(90, rectangle(20, 320, "solid", aksentfarger.first)),
        90, 80,
          place-image(
          rectangle(20, 320, "solid", aksentfarger.first),
          80, 0,
            place-image(
              rotate(90, rectangle(40, 320, "solid", aksentfarger.get(1))),
              90, 80,
              place-image(
                rectangle(40, 320, "solid", aksentfarger.get(1)),
              80, 0,
                rectangle(240, 160, "solid", bakgrunnsfarge)))))
    end
  else if landkode == "Den":
    block:
      bakgrunnsfarge = nordiskeflagg.row-n(1)["bakgrunnsfarge"]
      aksentfarger = nordiskeflagg.row-n(1)["aksentfarger"]
        place-image(
        rotate(90, rectangle(30, 320, "solid", aksentfarger)),
        120, 80,
          place-image(
          rectangle(30, 320, "solid", aksentfarger),
          80, 0,
                rectangle(240, 160, "solid", bakgrunnsfarge)))
    end
else if landkode == "Sve":
    block:
      bakgrunnsfarge = nordiskeflagg.row-n(2)["bakgrunnsfarge"]
      aksentfarger = nordiskeflagg.row-n(2)["aksentfarger"]
        place-image(
        rotate(90, rectangle(30, 320, "solid", aksentfarger)),
        120, 80,
          place-image(
          rectangle(30, 320, "solid", aksentfarger),
          90, 0,
                rectangle(240, 160, "solid", bakgrunnsfarge)))
    end
else if landkode == "Isl":
    block:
      bakgrunnsfarge = nordiskeflagg.row-n(3)["bakgrunnsfarge"]
      aksentfarger = string-split(nordiskeflagg.row-n(3)["aksentfarger"], ",")
        place-image(
          rotate(90, rectangle(20, 320, "solid", aksentfarger.first)),
          90, 80,
          place-image(
            rectangle(20, 320, "solid", aksentfarger.first),
          80, 0,
            place-image(
              rotate(90, rectangle(40, 320, "solid", aksentfarger.get(1))),
              90, 80,
              place-image(
                rectangle(40, 320, "solid", aksentfarger.get(1)),
              80, 0,
                rectangle(240, 160, "solid", bakgrunnsfarge)))))
    end
else if landkode == "Fae":
    block:
      bakgrunnsfarge = nordiskeflagg.row-n(4)["bakgrunnsfarge"]
      aksentfarger = string-split(nordiskeflagg.row-n(4)["aksentfarger"], ",")

        place-image(
        rotate(90, rectangle(20, 320, "solid", aksentfarger.first)),
        90, 80,
          place-image(
          rectangle(20, 320, "solid", aksentfarger.first),
          80, 0,
            place-image(
              rotate(90, rectangle(40, 320, "solid", aksentfarger.get(1))),
              90, 80,
              place-image(
                rectangle(40, 320, "solid", aksentfarger.get(1)),
              80, 0,
                rectangle(240, 160, "solid", bakgrunnsfarge)))))
    end
  else if landkode == "Fin":
    block:
      bakgrunnsfarge = nordiskeflagg.row-n(5)["bakgrunnsfarge"]
      aksentfarger = nordiskeflagg.row-n(5)["aksentfarger"]
        place-image(
        rotate(90, rectangle(30, 320, "solid", aksentfarger)),
        120, 80,
          place-image(
          rectangle(30, 320, "solid", aksentfarger),
          80, 0,
                rectangle(240, 160, "solid", bakgrunnsfarge)))
    end
  end
end

### Laget en tabell som viser brukeren landkodene for å tegne flagg. ###

Intro = 
  table:Land, landkode
    row: "Norge", "Nor"
    row: "Danmark", "Den"
    row: "Sverige", "Sve"
    row: "Island", "Isl"
    row: "Færøyene", "Fae"
    row: "Finland", "Fin"
  end
print(Intro)

("For å starte å tegne, skriv tegnflagg pluss (landkode).")
