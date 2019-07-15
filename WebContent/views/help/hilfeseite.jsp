<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <title>The Social Network-Hilfeseite </title>
    <%@include file="/includes/head.jsp" %>
    <style>
        .nav-tabs {
            margin-top: 20px;
            padding: 0 20px;
        }

        .card {
            margin: 10px;
        }

        .tab-content {
            padding: 30px;
        }
    </style>
</head>

<body>
<jsp:include page="/includes/navbar.jsp"/>

<ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
        <a class="nav-link active" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
           aria-selected="true">Profil</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" id="posts-tab" data-toggle="tab" href="#posts" role="tab" aria-controls="posts"
           aria-selected="false">Posts</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" id="chat-tab" data-toggle="tab" href="#chat" role="tab" aria-controls="chat"
           aria-selected="false">Chat</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" id="otherprofiles-tab" data-toggle="tab" href="#otherprofiles" role="tab"
           aria-controls="otherprofiles"
           aria-selected="false">Andere Profile</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" id="others-tab" data-toggle="tab" href="#others" role="tab" aria-controls="others"
           aria-selected="false">Sonstiges</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" id="team-tab" data-toggle="tab" href="#team" role="tab" aria-controls="team"
           aria-selected="false">Team</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" id="impressum-tab" data-toggle="tab" href="#impressum" role="tab" aria-controls="impressum"
           aria-selected="false">Impressum</a>
    </li>
</ul>
<div class="tab-content">
    <div class="tab-pane fade show active" id="profile" role="tabpanel" aria-labelledby="profile-tab">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Registrierung</h5>
                <p>Falls der Benutzer noch nicht angemeldet ist, muss zuerst eine Registrierung erfolgen. Dies ist unter
                    angabe von Name, Email-Adresse, Passwort und gewünschtem Handle <a href="/register">hier</a> möglich</p>
            </div>
        </div>

        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Profilansicht</h5>
                <p>Durch Klick auf "Profil" in der oberen Navigation (nach erfolgreichem Einloggen)
                    &#xC4;nderung des Profilbilds: Klicke auf kleinen Icon (Stift) rechts unten neben dem Profilbild.<br>
                    &#xC4;nderung des Titelbilds: Klick auf kleinen Icon (Stift) rechts unten neben dem Titelbild.<br><br>
                </p>
            </div>
        </div>

        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Profilangaben &#xE4;ndern</h5>
                <p>
                    Navigiere zuerst zu deiner Profilseite. Dann auf der rechten Seite unterhalb des
                    Titelbilds befindet sich eine Schaltfl&#xE4;che mit der Aufschrift &#x201E;Profil bearbeiten&#x201C;. Nach
                    Klick auf diesem kann in einem Dialogfenster der Nutzername (wie angezeigt), Email-Adresse, Handle oder
                    Passwort ver&#xE4;ndert werden &#x2013; zur &#xC4;nderung des Profilbilds siehe abschnitt Profilansicht.
                </p>
            </div>
        </div>
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Folgen und Posts</h5>
                <p>
                    &#xDC;ber den Reiter &#x201E;Posts&#x201C; k&#xF6;nnen die eigenen Posts angeschaut werden (beim
                    Scrollen nach ganz unten kann &#xFC;ber &#x201E;Load More&#x201C; können weitere Posts nachgeladen
                    werden).
                    &#xDC;ber den Reiter &#x201E;Folge ich&#x201C; werden alle Profile angezeigt, denen ich folge.
                    &#xDC;ber das Textfeld mit der Inschrift &#x201E;Schreib etwas&#x2026;&#x201C; k&#xF6;nnen mehr
                    Posts erstellt werden. Auf der rechten Seite dieser Textbox befindet sich ein Button zum
                    Posten von Bildern.
                </p>
            </div>
        </div>
    </div>

    <div class="tab-pane fade" id="posts" role="tabpanel" aria-labelledby="posts-tab">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Post ver&#xF6;ffentlichen</h5>
                <p>Im Feed oben mittig in der Textbox mit der Inschrift &#x201E;Schreib etwas&#x2026;&#x201C;
                    Text eingeben, der dann per dr&#xFC;cken der Enter-Taste ver&#xF6;ffentlicht wird.Jeder der einem folgt
                    sieht diesen Post. Rechts daneben ist ein Button mit einem Bild-Icon. Nach Klick auf diese
                    Schaltfl&#xE4;che und Auswahl eines Bildes, kann dieses im Newsfeed ver&#xF6;ffentlicht werden und
                    von allen, die einem folgen gesehen werden. Der Post kann per Icon Mülltonne gelöscht werden.</p>
            </div>
        </div>
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Posts liken</h5>
                <p>Du magst einen Post und willst dies öffentlich kundtun? Dann einfach auf das Herz klicken.</p>
            </div>
        </div>
    </div>


    <div class="tab-pane fade" id="chat" role="tabpanel" aria-labelledby="chat-tab">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Mit Follower chatten</h5>
                <p>Du kannst mit allen deinen Freunden, denen zu folgst chatten. Dazu auf der rechten Seite des Feeds oben
                    &#xFC;ber das
                    Profilbild den Chatpartner ausw&#xE4;hlen. Jetzt siehst du den Chatverlauf</p>
            </div>
        </div>
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Nachricht senden</h5>
                <p>Rechts unten befindet sich eine Textbox mit der Inschrift &#x201E;Schreib etwas&#x2026;&#x201C;. In
                    diese kannst Du eingaben t&#xE4;tigen. Mit Klick auf den Papierflieger rechts davon kann die
                    Nachricht an Deinen Partner &#xFC;bermittelt werden. Deine Nachrichten stehen rechts im Chatverlauf,
                    die deines Partners links.</p>
            </div>
        </div>
    </div>

    <div class="tab-pane fade" id="otherprofiles" role="tabpanel" aria-labelledby="otherprofiles-tab">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Freundschaftsvorschläge</h5>
                <p>Im Feed auf der linken Seite befinden sich Freundschaftsvorschl&#xE4;ge.
                    Durch Klick auf &#x201E;Load More&#x201C; k&#xF6;nnen sogar noch mehr Freundschaftsvorschl&#xE4;ge
                    geladen werden.</p>
            </div>
        </div>

        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Andere Profile anschauen</h5>
                <p>Zum n&#xE4;heren Betrachten einfach auf das Handle oder den Nutzernamen/Username klicken. In der
                    Tableiste k&#xF6;nnen unter dem Reiter Posts alle Posts, unter Folge ich, alle Profile, denen diese
                    Person folgt und unter Follower, alle Personen, die diesem Profil folgen, betrachtet werden.</p>
            </div>
        </div>

        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Anderen Profile folgen</h5>
                <p>Einfach den entsprechenden Button "Folgen" zum Folgen klicken und "Unfollow" zum nicht mehr
                    folgen. Wenn Du jemandem aktiv folgst, werden Dir seine/ihre Posts angezeigt!</p>
            </div>
        </div>

        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Andere Profile suchen</h5>
                <p>Oben in der Navigationsleitse im Suchfeld bitte die entsprechende Eingabe t&#xE4;tigen und dann rechts
                    davon auf die Lupe klicken. Suche
                    erfolgt folgenderma&#xDF;en: *Suchwort*. Es kann also mit &#x201E;Mu&#x201C; Elon Musk ausfindig
                    gemacht werden.</p>
            </div>
        </div>
    </div>

    <div class="tab-pane fade" id="others" role="tabpanel" aria-labelledby="others-tab">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Zur&#xFC;ck zur Hauptseite Feed</h5>
                <p>Einfach links oben auf die Schaltfl&#xE4;che SocialNetwork oder auf Feed (rechts daneben)
                    klicken.</p>
            </div>
        </div>
    </div>

    <div class="tab-pane fade" id="team" role="tabpanel" aria-labelledby="team-tab">
        <jsp:include page="team.jsp"/>
    </div>

    <div class="tab-pane fade" id="impressum" role="tabpanel" aria-labelledby="impressum-tab">
        <jsp:include page="impressum.jsp"/>
    </div>
</div>
<script src="/js/scripts.js"></script>
</body>
</html>