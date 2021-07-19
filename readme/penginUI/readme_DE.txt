####Versionsdetails####

Steam Layout - PenginUI
Letzte Änderungen: 19.07.2021
Version: 0.99.9

Steamprofil: https://steamcommunity.com/id/pen-chan/
Webseite: https://www.gameindustry.eu/
Lizenz: https://creativecommons.org/licenses/by-nc-nd/4.0/deed.de

#### Kurzbeschreibung ####
Einzigartiger Steam Style mit Fokus auf das Wesentliche. Es wurde Wert darauf gelegt unnötige Funktionen und Werbung weitesgehend im Client auszublenden und somit eine minimalistische und saubere UI für Steam zu erstellen. Der Skin ist ein fortlaufendes Projekt, d.h. es gibt viele Stellen die sich ändern und nicht unbedingt perfekt gelöst sind.

#### Skin installieren ####

Steamordner aufrufen
Der Inhalt des Archivs wird in das Installationsverzeichnis von Steam kopiert

Die steam.cfg sagt dem Client, sich nicht selbst upzudaten, da sonst die Anpassungen der libaryroot.css jedes Mal verloren gehen.
Wer den Client aktualisieren will, muss dafür die steam.cfg löschen/umbenennen, aktualisieren und danach wieder aktivieren und die libaryroot.css wieder einfügen. Alternativ die Bibliotheksanpassungen ignorieren. Die sind optional.

Den Steamclient öffnen
Einstellungen -> Oberfläche -> Wählen Sie den Namen Pengin aus der Liste aus und bestätigen aus
Steam neustarten
fertig

#### Optional ####
Im Ordner "optional" befinden sich kleinere Anpassungen für die Bibliothek die selbst hinzugefügt oder entfernt werden können

#### Eigener Skin schon in Verwendung? ####
Kein Problem, die webkit.css aus dem Verzeichnins *\Pengin\resource\ kann entweder im Ganzen für den eigenen Skin übernommen werden oder pickt für sich benötigte Stellen aus dem Guide oder der Datei für sich heraus. Daran denken von einer bereits vorhandenen Datei ein Backup anzulegen.

#### Einige der getätigten Layoutänderungen ####

Bibliothek:
- Kartenanimationen abgeschwächt
- Rating für News werden jetzt in der Bibliothek angezeigt (Daumen hoch und bisherige Stimmen)
- Hintergrund ausgeblendet
- Transparenz im Header deaktiviert
- Was ist neu? ausgeblendet
- SVG "Medialle" für Erfolge ausgeblendet und Balken zentriert
- Animation für Erfolge gestoppt
- Box "Würden Sie dieses Spiel empfehlen" ausgeblendet
- Rahmen der Update(Spotlight)grafiken ersetzt und Animationen gelöscht
- Die Schrift für Produktkategorien wurde von "Uppercase" auf normal geändert
- Schrift für eigene Applikationen auf Produktbildern etwas versetzt
- Die *Shining"animation auf Produktbildern wurde entfernt
- Hintergrundbilder wurden entfernt und Farben angepasst
- Animationen der Entwicklerneuigkeiten entfernt
- Broadcasting entfernt
- Abstimmung kleinerer Farbnuancen

Globale Änderungen:
- Headergrafiken entfernt
- Hintergrundbilder entfernt
- Hintergrundfarbe gewechselt
- Menüfarbe gewechselt
- Hover (Mouseover) Fenster angepasst
- Steamlabs Werbung in der Suche ausgeblendet
- Anpassung Modalfunktionen und Forentooltips
- Ignorierte Nutzer werden nun wirklich ausgeblendet (Profil und Forum)
- Buttonfarben geändert
- Rock Paper Shotgun und andere Drittanbieter aus den News getilgt
- Steamlabs Banner entfernt
- Zusätzliche Menüpunkte im Header hinzugefügt

Sonderaktionen / Events / Publisheraktionen (bisher nur ein Event):
- Hintergrundbild entfernt
- Header entfernt
- Schriftfarben geändert
- Kategoriefarbe geändert
- Anpassung der Luna Festival Seiten
- Inhalte von Aktionsseiten (z.b. Rockstar Publisher Wochenende) wurden nicht angezeigt - Klassen überschneiden sich mit Broadcastinginhalten
- Bafta (Eventbanner) auf Produktseiten entfernt
- Golden Week Hintergrund  entfernt
- Weitere Eventbanner ausgeblendet
- Anpassungen für das Herbstevent 2020

Startseite Änderungen und ausgeblendet:
- Geschenkgutkartenwerbung
- Hardwarewerbung
- Empfehlungen der Steamlaboratorien
- Beliebte VR Spiele
- Spiele die gerade gestreamt werden (Broadcast)
- Kuratoren
- Footer
- Endloswerbung unter dem Footer
- Entdeckungsliste
- Early Access Forenverweise
- Top Steam Releases
- Kürzlich Aktualisiert: Anpassung der Tooltips
- Aktivitäten von Freunden: Anpassung der Tooltips, Hintergrund entfernt
- Hotfix für Top-Releases auf der Startseite
- Hotfix für Hovergrafiken
- Menüfarben angepasst
- Buttons angeglichen

Produktseiten & Suche:
- Kuratoren
- befreundete Kuratoren
- Bilder in Spielbeschreibungen
- Weitere Zusatzinhalte für dieses Spiel
- Broadcast
- Steamlabs Icon deaktiviert

Eingeblendet wird (wieder):
- Spiel/Produkticon im Titelbereich

Warenkorb:
- Werbung in der rechten Spalte ausgeblendet

Profiländerungen & Gruppen:
- Hintergrund fixiert
- Inlayhintergrund entfernt
- Hintergrund und Header auf Transparent gesetzt
- Profilabschnitte auf transparent gesetzt und blaue Steamgrafiken ausgeblendet
- Eingabefeld für Kommentarbox vergrößert
- Headertextur entfernt
- Weiterführenden Informationslink zentriert
- Gestrichelte Linie unter Überschriften entfernt
- Geänderte Avatarrahmen
- Abzeichen angepasst
- Tooltipfarbe geändert
- Anpassung der Screenshot und Artworkscontainer
- Anpassung der Hintergrunddarstellung
- Überschriften nun Weiss und in Großschrift
- Animierte Hintergründe bewegen sich nun nicht mehr mit
- Der überflüssige "Steam Gruppe" Labeltag wurde entfernt

### Anmerkung zur Profilseite ###
Der Hintergrund auf der Profilseite bleibt schwarz. Das liegt an der allgemeinen Gestaltung der veröffentlichten Wallpaper auf Steam, da alle mit Schwarz abschließen.

Inventory:
- Farbliche Anpassung, CSS Transition (noch nicht abgeschlossen)

Gruppe/n:
- Die Mitgliederavatare im Kopfbereich einer Gruppe werden ausgeblendet
- Schwarzer Balken im Headerbereich entfernt

Sonstiges:
- Minigrafiken (unten rechts) in den Vorschaubildern für Guide & Workshopobjekte werden ausgeblendet
- Kommentarabofunktion wird nun in geposteten Statusmeldungen, Screenshots, Favouriten usw. direkt angezeigt