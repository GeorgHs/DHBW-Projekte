<!DOCTYPE html><html><head>
	<%@include file="/includes/head.jsp"%>
   	<meta charset="utf-8">
  	<title>The Social Network-Hilfeseite </title>
  	  <style>
  	.rcorners1 {
  border-radius: 25px;
  background-color:Aliceblue;
  padding: 20px; 
  width: 300px;
   text-align: left;
}
*[name="textgrid"] {
	
}
  	
  	</style>
</head>

<body>
	


  
<ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item">
    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="home" aria-selected="true">Profil</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#posts" role="tab" aria-controls="profile" aria-selected="false">Posts</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#chat" role="tab" aria-controls="contact" aria-selected="false">Chat</a>
  </li>
   <li class="nav-item">
    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#otherprofiles" role="tab" aria-controls="contact" aria-selected="false">Andere Profile</a>
  </li>
   <li class="nav-item">
    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#others" role="tab" aria-controls="contact" aria-selected="false">Sonstiges</a>
  </li>
</ul>
<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="profile" role="tabpanel" aria-labelledby="home-tab">
				<h3>Registrierung</h3>
						<div class="rcorners1">
						<p>Falls der Benutzer noch nicht eingeloggt ist, muss eine Registrierung erfolgen. Dies ist m&#xF6;glich &#xFC;ber den Link: &#x201E;Haven&#x27;t got an account?   <a href="/login" 
		   					title="mehr Informationen"> Register here Äù</a>  Dann muss Eingabe folgender Daten nachgegangen werden: Username - Nutzername, Email Address, Password, Handle.</p>
				</div>

				<h3>Profilansicht</h3>
				<div class="rcorners1">
				 <p>1. Durch Klick auf den dritten Link von Links in der oberen Leiste (nach erfolgreichem Einloggen) oder <br>     2. durch Klick auf den Link des eigenen Profilnamens auf der oberen linken Seite &#x2013; <br>
					&#xC4;nderung des Profilbilds: Klicke auf kleinen Icon (Stift) rechts unten neben dem Profilbild.<br>
					&#xC4;nderung des Titelbilds: Klick auf kleinen Icon (Stift) rechts unten neben dem Titelbild.<br><br>
				</p>
				</div>
				
				
				<h3>Profilangaben &#xE4;ndern</h3>
				<div class="rcorners1">
					Man muss bereits die Profilansicht ausgew&#xE4;hlt haben. Dann auf der rechten Seite unterhalb des Titelbilds befindet sich eine Schaltfl&#xE4;che mit der Aufschrift &#x201E;Profil bearbeiten&#x201C;. Nach Klick auf diesem kann in einem Dialogfenster der Nutzername (wie angezeigt), Email-Adresse, Handle oder Passwort ver&#xE4;ndert werden &#x2013; zur &#xC4;nderung des Profilbilds bitte siehe Profilansicht.<br>
				
				</div>
				
				<h3>Folgen und Posts</h3>
				<div class="rcorners1">
					<p>&#xDC;ber den Reiter &#x201E;Posts&#x201C; k&#xF6;nnen die eigenen Posts angeschaut werden (beim Scrollen nach ganz unten kann &#xFC;ber &#x201E;Load More&#x201C; noch mehr ausgew&#xE4;hlt werden).  &#xDC;ber den Reiter &#x201E;Folge ich&#x201C; werden alle Profile angezeigt, denen ich folge. &#xDC;ber
					&#xDC;ber das Textfeld mit der Inschrift &#x201E;Schreib etwas&#x2026;&#x201C; k&#xF6;nnen mehr Posts eingef&#xFC;gt werden. Auf der rechten Seite dieser Textbox befindet sich ein Button zum Posten von Bildern.
					
				
				</div>
	</div>
  <div class="tab-pane fade" id="posts" role="tabpanel" aria-labelledby="profile-tab">
				<h3>Post ver&#xF6;ffentlichen</h3>			
  				<div class="rcorners1">
					<p>Im Feed (Seite nach Einloggen) oben mittig in der Textbox mit der Inschrift &#x201E;Schreib etwas&#x2026;&#x201C; Text eingeben, der dann per dr&#xFC;cken der Enter-Taste ver&#xF6;ffentlicht wird. Alle die einem folgen sehen diesen Post. Rechts daneben ist ein Button mit einem Bild-Icon. Nach Klick auf diese Schaltfl&#xE4;che und Auswahl eines Bildes, kann dieses im Newsfeed ver&#xF6;ffentlicht werden und von allen, die einem folgen gesehen werden. Der Post kann per Icon M¸lltonne gelˆscht werden.</p>				
				</div>
  				<h3>Posts liken</h3>				
  				<div class="rcorners1">
					<p>Du magst einen Post und willst diesen allen Deinen Followern zeigen? Dann einfach auf das Herz klicken.</p>
				</div>
  </div>
  <div class="tab-pane fade" id="chat" role="tabpanel" aria-labelledby="contact-tab">
				<h3>Mit Follower chatten</h3>
				<div class="rcorners1">
					<p>Du kannst mit allen Followern chatten. Dazu auf der rechten Seite vom Feed oben &#xFC;ber  das Profilbild den Chatpartner ausw&#xE4;hlen. Jetzt siehst du den Chatverlauf</p>
				</div>
				<h3>Nachricht senden</h3>
				<div class="rcorners1">
					<p>Rechts unten befindet sich eine Textbox mit der Inschrift &#x201E;Schreib etwas&#x2026;&#x201C;. In diese kannst Du Eingaben t&#xE4;tigen. Mit Klick auf den Papierflieger rechts davon kann die Nachricht an Deinen Partner &#xFC;bermittelt werden. Deine Nachrichten stehen rechts im Chatverlauf, die Deines Partners links.</p>
				</div>
</div>
  <div class="tab-pane fade" id="otherprofiles" role="tabpanel" aria-labelledby="contact-tab">
  			<h3>Freundschaftsvorschl&auml;ge</h3>		
  			<div class="rcorners1">
  			<p>Im Feed (Seite nach erfolgreichem Einloggen) auf der linken Seite befinden sich Freundschaftsvorschl&#xE4;ge. Durch Klick auf &#x201E;Load More&#x201C; k&#xF6;nnen sogar noch mehr Freundschaftsvorschl&#xE4;ge geladen werden.</p>
  			</div>
  			
  			<h3>Andere Profile anschauen</h3>
  			<div class="rcorners1">
  				<p>Zum n&#xE4;heren Betrachten einfach auf das Handle oder den Nutzernamen/Username klicken. In der Tableiste k&#xF6;nnen unter dem Reiter Posts alle Posts, unter Folge ich, alle Profile, denen dieses Profil folgt und unter Follower, alle Profile, die diesem Profil folgen, betrachtet werden.</p>
  			</div>
  			
  			<h3>Anderen Profile folgen</h3>
  			<div class="rcorners1">
  				<p>Einfach den entsprechenden Button "Folgen"Äú zum Folgen klicken und "ÄûUnfollow"Äú zum nicht mehr folgen. Wenn Du jemandem aktiv folgst, werden Dir seine/ihre Posts angezeigt! <br><br></p>
  			</div>
  			<h3>Andere Profile suchen</h3>
	  		<div class="rcorners1">
	  			<p>Oben in der Leiste in der Textbox mit der Inschrift &#x201E;&#x2018;@&#x2018; show all users &#x201C; bitte die entsprechende Eingabe t&#xE4;tigen und dann rechts davon auf die Lupe klicken. Suche erfolgt folgenderma&#xDF;en: *Suchwort*. Es kann also mit &#x201E;Mu&#x201C; Elon Musk ausfindig gemacht werden.</p>
	  		</div>
  </div>
  <div class="tab-pane fade" id="others" role="tabpanel" aria-labelledby="contact-tab">
  			<h3>Zur&#xFC;ck zur Hauptseite Feed</h3>
	  		<div class="rcorners1">
	  			<p>Einfach links oben auf die Schaltfl&#xE4;che SocialNetwork klicken. Oder auf Feed rechts daneben klicken.<br><br><br></p>
	  		</h3>
	  		
  </div>
</div>
<div class="container">
    <div class="row justify-content-center">
        
    </div>
</div>

 <ul class="nav nav-pills">
  <li class="nav-item">
    <a class="nav-link" href="team.jsp">The Social Network Team</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="impressum.jsp">Impressum</a>
  </li>
  <li class="nav-item">
    <a class="nav-link active" href="Hilfeseite.jsp">Hilfe</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="/login">Login</a>
  </li>
</ul>
 
</body></html>