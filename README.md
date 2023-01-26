# (Probe-)Installation Freescout als webfactory Helpdesk/Ticketing-System

Für alle Details zu Freescout siehe https://github.com/freescout-helpdesk/freescout.

Weil sich das Projekt scheinbar nicht so einfach als Composer-Dependency installieren lässt, basiert die Installation auf einem Fork des Original-Repos. Basierend auf der letzten Release-Version habe ich den Branch `webfactory-deployment` angelegt. Dieser enthält im wesentlichen die Dinge die es braucht, um das Projekt mit `phlough install` einrichten zu können.

`phlough project:setup-db` wird auch eine Demo-Datenbank mit einem Testuser `test@webfactory.de`/`asdfgh123!` anlegen.

Eventuell kommt es bei der Erstinstallation zu Problemen, weil die notwendigen Skripte zum Bauen eines Caches, von Modulen etc. in `meta/project.xml` nicht laufen, wenn noch keine Datenbank vorhanden ist. Also evtl. beim ersten Mal auskommentieren.

