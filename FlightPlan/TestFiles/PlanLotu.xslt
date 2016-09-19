<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes" encoding="iso-8859-2"/>

    <xsl:template match="/">
        <xsl:copy>
          <html>
            <head>
              <title>
                Plan lotu numer: <xsl:value-of select="PlanLotu/@nr"/>
              </title>
              <style type="text/css">
                html {
                font-family: Verdana;
                }
                .naglowek
                {
                color: white;
                background-color: gray;
                font-weight: bold;
                font-size: 16px;
                }
                .naglowek2
                {
                background-color: #d3d3d3;
                }
                .tytul
                {
                color: white;
                background-color: gray;
                font-weight: bold;
                font-size:18px;
                padding: 10px 10px 10px 10px;
                }
              </style>
            </head>
            <body>
              <div class="tytul">
                <p>
                  Plan lotu numer: <xsl:value-of select="PlanLotu/@nr"/>
                </p>
              </div>
              <div>
                <table style="width:33%; text-align: left; border:1px solid black; font-size: 14px; float:left;">
                  <tr class="naglowek">
                    <td  colspan="2">DANE IDENTYFIKACYJNE</td>
                  </tr>
                  <tr>
                    <td>DATA</td>
                    <td>
                      <xsl:value-of select="PlanLotu/Lot/DaneIdentyfikacyjne/DataWprowadzenia"/>
                    </td>
                  </tr>
                  <tr>
                    <td>PRZEWOZNIK</td>
                    <td>
                      <xsl:value-of select="PlanLotu/Lot/DaneIdentyfikacyjne/NazwaPrzewoznika"/>
                    </td>
                  </tr>
                  <tr>
                    <td>KOD LOTU</td>
                    <td>
                      <xsl:value-of select="PlanLotu/Lot/DaneIdentyfikacyjne/KodLotu"/>
                    </td>
                  </tr>
                  <tr>
                    <td>TYP LOTU</td>
                    <td>
                      <xsl:value-of select="PlanLotu/Lot/DaneIdentyfikacyjne/TypLotu"/>
                    </td>
                  </tr>
                  <tr>
                    <td>CZAS TRWANIA </td>
                    <td>
                      <xsl:value-of select="PlanLotu/Lot/DaneIdentyfikacyjne/CzasTrwania"/>
                    </td>
                  </tr>
                  <tr class="naglowek2">
                    <td colspan="2">WYLOT</td>
                  </tr>
                  <tr>
                    <td>PLANOWY CZAS WYLOTU:</td>
                    <td>
                      <xsl:value-of select="PlanLotu/Lot/Wylot/PlanowyCzasWylotu"/>
                    </td>
                  </tr>
                  <tr>
                    <td>LOTNISKO WYLOTU:</td>
                    <td>
                      <xsl:value-of select="PlanLotu/Lot/Wylot/LotniskoWylotu"/>
                    </td>
                  </tr>
                  <tr class="naglowek2">
                    <td colspan="2">PRZYLOT</td>
                  </tr>
                  <tr>
                    <td>PLANOWY CZAS PRZYLOTU:</td>
                    <td>
                      <xsl:value-of select="PlanLotu/Lot/Przylot/PlanowyCzasPrzylotu"/>
                    </td>
                  </tr>
                  <tr>
                    <td>LOTNISKO PRZYLOTU:</td>
                    <td>
                      <xsl:value-of select="PlanLotu/Lot/Przylot/LotniskoPrzylotu"/>
                    </td>
                  </tr>
                  <tr class="naglowek">
                    <td colspan="2">SAMOLOT</td>
                  </tr>
                  <tr>
                    <td>MODEL</td>
                    <td>
                      <xsl:value-of select="PlanLotu/Samolot/ModelSamolotu"/>
                    </td>
                  </tr>
                  <tr>
                    <td>ROK PRODUKCJI</td>
                    <td>
                      <xsl:value-of select="PlanLotu/Samolot/RokProdukcji"/>
                    </td>
                  </tr>
                  <tr>
                    <td>LICZBA SILNIKÓW</td>
                    <td>
                      <xsl:value-of select="PlanLotu/Samolot/LiczbaSilnikow"/>
                    </td>
                  </tr>
                  <tr>
                    <td>PRĘDKOŚĆ MAKSYMALNA</td>
                    <td>
                      <xsl:value-of select="PlanLotu/Samolot/Osiagi/Predkosc/Maksymalna"/>
                      <xsl:value-of select="PlanLotu/Samolot/Osiagi/Predkosc/Maksymalna/@jednostka"/>
                    </td>
                  </tr>
                  <tr>
                    <td>PRĘDKOŚĆ PRZELOTOWA</td>
                    <td>
                      <xsl:value-of select="PlanLotu/Samolot/Osiagi/Predkosc/Przelotowa"/>
                      <xsl:value-of select="PlanLotu/Samolot/Osiagi/Predkosc/Przelotowa/@jednostka"/>
                    </td>
                  </tr>
                  <tr>
                    <td>PUŁAP</td>
                    <td>
                      <xsl:value-of select="PlanLotu/Samolot/Osiagi/Pulap"/>
                      <xsl:value-of select="PlanLotu/Samolot/Osiagi/Pulap/@jednostka"/>
                    </td>
                  </tr>
                  <tr>
                    <td>ZASIĘG</td>
                    <td>
                      <xsl:value-of select="PlanLotu/Samolot/Osiagi/Zasieg"/>
                      <xsl:value-of select="PlanLotu/Samolot/Osiagi/Zasieg/@jednostka"/>
                    </td>
                  </tr>
                  <tr>
                    <td>LICZBA MIEJSC</td>
                    <td>
                      <xsl:value-of select="PlanLotu/Samolot/LiczbaMiejsc"/>
                    </td>
                  </tr>
                  <tr class="naglowek2">
                    <td colspan="2">WAGA</td>
                  </tr>
                  <tr>
                    <td>BEZ PALIWA</td>
                    <td>
                      <xsl:value-of select="PlanLotu/Samolot/Waga/WagaBezPaliwa"/>
                      <xsl:value-of select="PlanLotu/Samolot/Waga/WagaBezPaliwa/@jednostka"/>
                    </td>
                  </tr>
                  <tr>
                    <td>STARTOWA CAŁKOWITA</td>
                    <td>
                      <xsl:value-of select="PlanLotu/Samolot/Waga/CalkowitaWagaStartowa"/>
                      <xsl:value-of select="PlanLotu/Samolot/Waga/CalkowitaWagaStartowa/@jednostka"/>
                    </td>
                  </tr>
                  <tr>
                    <td>KOŃCOWA CAŁKOWITA</td>
                    <td>
                      <xsl:value-of select="PlanLotu/Samolot/Waga/CalkowitaWagaKoncowa"/>
                      <xsl:value-of select="PlanLotu/Samolot/Waga/CalkowitaWagaKoncowa/@jednostka"/>
                    </td>
                  </tr>
                  <tr>
                    <td>WAGA PALIWA</td>
                    <td>
                      <xsl:value-of select="PlanLotu/Samolot/Waga/Paliwo/WagaPoczatkowa"/>
                      <xsl:value-of select="PlanLotu/Samolot/Waga/Paliwo/WagaPoczatkowa/@jednostka"/>
                    </td>
                  </tr>
                  <tr>
                    <td>REZERWA PALIWA</td>
                    <td>
                      <xsl:value-of select="PlanLotu/Samolot/Waga/Paliwo/Rezerwa"/>
                      <xsl:value-of select="PlanLotu/Samolot/Waga/Paliwo/Rezerwa/@jednostka"/>
                    </td>
                  </tr>
                  <tr class="naglowek2">
                    <td colspan="2">PILOCI</td>
                  </tr>
                  <xsl:for-each select="PlanLotu/Samolot/Pilot">
                    <tr>
                      <td>
                        <xsl:value-of select="Stanowisko"/>
                      </td>
                      <td>
                        <xsl:value-of select="ImieNazwisko"/>
                      </td>
                    </tr>
                    <tr>
                      <td>PRZELATANE GODZINY</td>
                      <td>
                        <xsl:value-of select="PrzelataneGodziny"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </table>
                <table style="width:67%; border: 1px solid black; font-size: 14px; float:left;">
                  <tr class="naglowek">
                    <td colspan="11">TRASA</td>
                  </tr>
                  <tr>
                    <td>ID PUNKTU</td>
                    <xsl:for-each select="PlanLotu/Trasa/PunktOrientacyjny">
                      <td>
                        <xsl:value-of select="@idPunktu"/>
                      </td>
                    </xsl:for-each>
                  </tr>
                  <tr>
                    <td>NAZWA PUNKTU</td>
                    <xsl:for-each select="PlanLotu/Trasa/PunktOrientacyjny">
                      <td>
                        <xsl:value-of select="NazwaPunktu"/>
                      </td>
                    </xsl:for-each>
                  </tr>
                  <tr>
                    <td>CZESTOTLIWOŚĆ</td>
                    <xsl:for-each select="PlanLotu/Trasa/PunktOrientacyjny">
                      <td>
                        <xsl:value-of select="CzestotliwoscRadiowa"/>
                      </td>
                    </xsl:for-each>
                  </tr>
                  <tr>
                    <td>WYSOKOŚĆ</td>
                    <xsl:for-each select="PlanLotu/Trasa/PunktOrientacyjny">
                      <td>
                        <xsl:value-of select="Wysokosc"/>
                        <xsl:value-of select="Wysokosc/@jednostka"/>
                      </td>
                    </xsl:for-each>
                  </tr>
                  <tr>
                    <td>AKTUALNY CZAS LOTU</td>
                    <xsl:for-each select="PlanLotu/Trasa/PunktOrientacyjny">
                      <td>
                        <xsl:value-of select="CzasLotu/AktualnyCzasLotu"/>
                      </td>
                    </xsl:for-each>
                  </tr>
                  <tr>
                    <td>POZOSTAŁY CZAS LOTU</td>
                    <xsl:for-each select="PlanLotu/Trasa/PunktOrientacyjny">
                      <td>
                        <xsl:value-of select="CzasLotu/PozostalyCzasLotu"/>
                      </td>
                    </xsl:for-each>
                  </tr>
                  <tr>
                    <td class="naglowek" colspan="11">WARUNKI POGODOWE</td>
                  </tr>
                  <tr>
                    <td>
                      KIERUNEK WIATRU
                    </td>
                    <td colspan="10">
                      <xsl:value-of select="PlanLotu/WarunkiPogodowe/Wiatr/Kierunek"/>
                      <xsl:value-of select="PlanLotu/WarunkiPogodowe/Wiatr/Kierunek/@jednostka"/>
                    </td>
                  </tr>
                  <tr>
                    <td>SIŁA WIATRU</td>
                    <td colspan="10">
                      <xsl:value-of select="PlanLotu/WarunkiPogodowe/Wiatr/Sila"/>
                      <xsl:value-of select="PlanLotu/WarunkiPogodowe/Wiatr/Sila/@jednostka"/>
                    </td>
                  </tr>
                  <tr>
                    <td>TEMPERATURA</td>
                    <td colspan="10">
                      <xsl:value-of select="PlanLotu/WarunkiPogodowe/Temperatura"/>
                      <xsl:value-of select="PlanLotu/WarunkiPogodowe/Temperatura/@jednostka"/>
                    </td>
                  </tr>
                  <tr>
                    <td>OPADY</td>
                    <xsl:variable name="opady" select="PlanLotu/WarunkiPogodowe/Opady"></xsl:variable>
                    <xsl:choose>
                      <xsl:when test="$opady='nie'">
                        <td style="color:green" colspan="10">NIE</td>
                      </xsl:when>
                      <xsl:otherwise>
                        <td style="color:red" colspan="10">TAK</td>
                      </xsl:otherwise>
                    </xsl:choose>
                  </tr>
                  <tr>
                    <td>BURZE</td>
                    <xsl:variable name="burze" select="PlanLotu/WarunkiPogodowe/Burze"></xsl:variable>
                    <xsl:choose>
                      <xsl:when test="$burze='nie'">
                        <td style="color:green" colspan="10">NIE</td>
                      </xsl:when>
                      <xsl:otherwise>
                        <td style="color:red" colspan="10">TAK</td>
                      </xsl:otherwise>
                    </xsl:choose>
                  </tr>
                </table>

              </div>
                  
   
            </body>
          </html>
  
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
