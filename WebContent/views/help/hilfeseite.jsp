<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <title>The Social Network-Hilfeseite </title>
    <%@include file="/includes/head.jsp" %>
    <style>
        .rcorners1 {
            border-radius: 25px;
            background-color: Aliceblue;
            padding: 20px;
            width: 300px;
            text-align: left;
        }
        #myTab {
            margin-top: 20px;
        }
        .tab-content {
            padding: 10px;
        }
    </style>
</head>

<body>
<jsp:include page="/includes/navbar.jsp" />

<ul class="nav nav-tabs" id="myTab" role="tablist">
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
<div class="tab-content" id="myTabContent">
    <div class="tab-pane fade show active" id="profile" role="tabpanel" aria-labelledby="profile-tab">
        <h5>Registrierung</h5>
        <div class="rcorners1">
            <p>Falls der Benutzer noch nicht eingeloggt ist, muss eine Registrierung erfolgen. Dies ist m&#xF6;glich
                &#xFC;ber den Link: &#x201E;Haven&#x27;t got an account? <a href="/login"
                                                                            title="mehr Informationen"> Register here
                    ��</a> Dann muss Eingabe folgender Daten nachgegangen werden: Username - Nutzername, Email Address,
                Password, Handle.</p>
        </div>

        <h5>Profilansicht</h5>
        <div class="rcorners1">
            <p>1. Durch Klick auf den dritten Link von Links in der oberen Leiste (nach erfolgreichem Einloggen) oder
                <br> 2. durch Klick auf den Link des eigenen Profilnamens auf der oberen linken Seite &#x2013; <br>
                &#xC4;nderung des Profilbilds: Klicke auf kleinen Icon (Stift) rechts unten neben dem Profilbild.<br>
                &#xC4;nderung des Titelbilds: Klick auf kleinen Icon (Stift) rechts unten neben dem Titelbild.<br><br>
            </p>
        </div>

        <h5>Profilangaben &#xE4;ndern</h5>
        <div class="rcorners1">
            Man muss bereits die Profilansicht ausgew&#xE4;hlt haben. Dann auf der rechten Seite unterhalb des
            Titelbilds befindet sich eine Schaltfl&#xE4;che mit der Aufschrift &#x201E;Profil bearbeiten&#x201C;. Nach
            Klick auf diesem kann in einem Dialogfenster der Nutzername (wie angezeigt), Email-Adresse, Handle oder
            Passwort ver&#xE4;ndert werden &#x2013; zur &#xC4;nderung des Profilbilds bitte siehe Profilansicht.<br>
        </div>

        <h5>Folgen und Posts</h5>
        <div class="rcorners1">
            <p>&#xDC;ber den Reiter &#x201E;Posts&#x201C; k&#xF6;nnen die eigenen Posts angeschaut werden (beim
                Scrollen nach ganz unten kann &#xFC;ber &#x201E;Load More&#x201C; noch mehr ausgew&#xE4;hlt werden).
                &#xDC;ber den Reiter &#x201E;Folge ich&#x201C; werden alle Profile angezeigt, denen ich folge.
                &#xDC;ber
                &#xDC;ber das Textfeld mit der Inschrift &#x201E;Schreib etwas&#x2026;&#x201C; k&#xF6;nnen mehr
                Posts eingef&#xFC;gt werden. Auf der rechten Seite dieser Textbox befindet sich ein Button zum
                Posten von Bildern.
        </div>
    </div>

    <div class="tab-pane fade" id="posts" role="tabpanel" aria-labelledby="posts-tab">
        <h5>Post ver&#xF6;ffentlichen</h5>
        <div class="rcorners1">
            <p>Im Feed (Seite nach Einloggen) oben mittig in der Textbox mit der Inschrift &#x201E;Schreib etwas&#x2026;&#x201C;
                Text eingeben, der dann per dr&#xFC;cken der Enter-Taste ver&#xF6;ffentlicht wird. Alle die einem
                folgen sehen diesen Post. Rechts daneben ist ein Button mit einem Bild-Icon. Nach Klick auf diese
                Schaltfl&#xE4;che und Auswahl eines Bildes, kann dieses im Newsfeed ver&#xF6;ffentlicht werden und
                von allen, die einem folgen gesehen werden. Der Post kann per Icon M�lltonne gel�scht werden.</p>
        </div>
        <h5>Posts liken</h5>
        <div class="rcorners1">
            <p>Du magst einen Post und willst diesen allen Deinen Followern zeigen? Dann einfach auf das Herz
                klicken.</p>
        </div>
    </div>

    <div class="tab-pane fade" id="chat" role="tabpanel" aria-labelledby="chat-tab">
        <h5>Mit Follower chatten</h5>
        <div class="rcorners1">
            <p>Du kannst mit allen Followern chatten. Dazu auf der rechten Seite vom Feed oben &#xFC;ber das
                Profilbild den Chatpartner ausw&#xE4;hlen. Jetzt siehst du den Chatverlauf</p>
        </div>
        <h5>Nachricht senden</h5>
        <div class="rcorners1">
            <p>Rechts unten befindet sich eine Textbox mit der Inschrift &#x201E;Schreib etwas&#x2026;&#x201C;. In
                diese kannst Du Eingaben t&#xE4;tigen. Mit Klick auf den Papierflieger rechts davon kann die
                Nachricht an Deinen Partner &#xFC;bermittelt werden. Deine Nachrichten stehen rechts im Chatverlauf,
                die Deines Partners links.</p>
        </div>
    </div>

    <div class="tab-pane fade" id="otherprofiles" role="tabpanel" aria-labelledby="otherprofiles-tab">
        <h5>Freundschaftsvorschl&auml;ge</h5>
        <div class="rcorners1">
            <p>Im Feed (Seite nach erfolgreichem Einloggen) auf der linken Seite befinden sich Freundschaftsvorschl&#xE4;ge.
                Durch Klick auf &#x201E;Load More&#x201C; k&#xF6;nnen sogar noch mehr Freundschaftsvorschl&#xE4;ge
                geladen werden.</p>
        </div>

        <h5>Andere Profile anschauen</h5>
        <div class="rcorners1">
            <p>Zum n&#xE4;heren Betrachten einfach auf das Handle oder den Nutzernamen/Username klicken. In der
                Tableiste k&#xF6;nnen unter dem Reiter Posts alle Posts, unter Folge ich, alle Profile, denen dieses
                Profil folgt und unter Follower, alle Profile, die diesem Profil folgen, betrachtet werden.</p>
        </div>

        <h5>Anderen Profile folgen</h5>
        <div class="rcorners1">
            <p>Einfach den entsprechenden Button "Folgen"�� zum Folgen klicken und "��Unfollow"�� zum nicht mehr
                folgen. Wenn Du jemandem aktiv folgst, werden Dir seine/ihre Posts angezeigt!</p>
        </div>

        <h5>Andere Profile suchen</h5>
        <div class="rcorners1">
            <p>Oben in der Leiste in der Textbox mit der Inschrift &#x201E;&#x2018;@&#x2018; show all users &#x201C;
                bitte die entsprechende Eingabe t&#xE4;tigen und dann rechts davon auf die Lupe klicken. Suche
                erfolgt folgenderma&#xDF;en: *Suchwort*. Es kann also mit &#x201E;Mu&#x201C; Elon Musk ausfindig
                gemacht werden.</p>
        </div>
    </div>

    <div class="tab-pane fade" id="others" role="tabpanel" aria-labelledby="others-tab">
        <h5>Zur&#xFC;ck zur Hauptseite Feed</h5>
        <div class="rcorners1">
            <p>Einfach links oben auf die Schaltfl&#xE4;che SocialNetwork klicken. Oder auf Feed rechts daneben
                klicken.</p>
        </div>
    </div>

    <div class="tab-pane fade" id="team" role="tabpanel" aria-labelledby="team-tab">
        <jsp:include page="team.jsp" />
    </div>

    <div class="tab-pane fade" id="impressum" role="tabpanel" aria-labelledby="impressum-tab">
        <jsp:include page="impressum.jsp" />
    </div>
</div>
<script src="/js/scripts.js"></script>
</body>
</html>